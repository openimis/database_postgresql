import pyodbc           # adapter for SQL Server
import psycopg2         # adapter for PostgreSQL
import configparser     # used to read settings from file
import datetime         # used to properly format dates and datetimes
import time             # used to calculate time taken

# loads connection configuration and migration settings from a file.
# In future the settings file could be specified with a parameter.
def getSettingsFromFile():
    print("Loading settings")
    try:
        global settings
        settings = configparser.ConfigParser()
        settings.read('settings.ini')
        global delete_data
        delete_data = settings["Other"].getboolean("delete_data")
        global historical
        historical = settings["Other"].getboolean("historical")
        global demo_fix
        demo_fix = settings["Other"].getboolean("demo_fix")
        if delete_data:
            print("  Tables in the new database will be emptied before migrating data.")
        else:
            print("  Migration data will be appended to the tables in the new database (existing data persists).")
        if historical:
            print("  Histrical data will be migrated to the new database.")
        else:
            print("  No historical data will be migrated.")
            global today
            global now
            today = datetime.date.today()
            now = datetime.datetime.now()
    except KeyError as e:
        print("\x1b[0;31;48m" + "Error while trying to load settings. " +\
              "Please make sure the settings.ini file exists in your working directory." + "\x1b[0m")
        exit(1)



# tries to connect to both databases
def connect():
    print("Setting up connection to the databases:")
    # Establish a connection to the SQL Serever Database
    old_connection_string = "Driver={ODBC Driver 17 for SQL Server};Server=" + settings["OldDB"]["host"] + "," +\
                            settings["OldDB"]["port"] + ";Database=" + settings["OldDB"]["name"] + ";UID=" +\
                            settings["OldDB"]["user"] + ";PWD=" + settings["OldDB"]["pwd"] + ";"
    try:
        global old_connection
        old_connection = pyodbc.connect(old_connection_string)
    except pyodbc.InterfaceError:
        print("\x1b[0;31;48m" + \
              "ERROR: Could not connect to the SQL Server database. Make sure the server is running and check your settings." +\
              "\x1b[0m")
        exit(1)
    print("  Connection to SQL Server database established.")

    #Establish a connection the the PostgreSQL Database
    new_connection_string = "host=" + settings["NewDB"]["host"] + " port=" + settings["NewDB"]["port"] + " dbname=" +\
                            settings["NewDB"]["name"] + " user=" + settings["NewDB"]["user"] + " password=" +\
                            settings["NewDB"]["pwd"]
    try:
        global new_connection
        new_connection = psycopg2.connect(new_connection_string)
    except psycopg2.OperationalError:
        print("\x1b[0;31;48m" + \
              "ERROR: Could not connect to the PostgreSQL database. Make sure the server is running and check your settings." +\
              "\x1b[0m")
        exit(1)

    # Make cursors for each database
    global old_cursor
    old_cursor = old_connection.cursor()
    global new_cursor
    new_cursor = new_connection.cursor()
    print("  Connection to PostgreSQL database established.\n")

# get an ordered list of all tables from a file
def getTablesFromFile():
    print("Finding all tables that need to be migrated.\n")
    try:
        table_file = open('tables.txt', 'r')
    except FileNotFoundError:
        print("\x1b[0;31;48m" + "Error while trying to load tables.txt. " +\
              "Please make sure the file exists in your working directory. \x1b[0m")
        exit(1)

    file_content = table_file.readlines()

    tables = list()
    for line in file_content:
        # ignore empty line and comment lines (starting with #)
        if not line.startswith("#") and not line in ['\n', '\r\n']:
            # strip("\r\n") removes line endings from strings
            tables.append(line.strip("\r\n"))
    return tables

# get Tables of both databases. This is done to make sure that we're not trying to read from (or write to) a table
# that does not exist
def getDBTables():
    # Get a list of all tables in each database
    print("Finding tables in both databases.\n")
    old_cursor.execute("SELECT TABLE_NAME FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_TYPE = 'BASE TABLE';")
    new_cursor.execute("SELECT table_name FROM information_schema.tables WHERE table_schema = 'public';")
    old_tables = list()
    for x in old_cursor:
        # Remove special characters at the start and end of each item when adding it to the list.
        # This way the entries in the old and new list match
        old_tables.append(str(x)[2:-4])
    new_tables = list()
    for x in new_cursor:
        # Remove special characters at the start and end of each item when adding it to the list.
        # This way the entries in the old and new list match
        new_tables.append(str(x)[2:-3])
    return (old_tables, new_tables)

# This function puts the data from a SELECT statement into string and formats it correctly so that postgres can work
# with it.
def generateInsertionString(row):
    row_str = "("
    for x in row:
        # Strings must be enclosed in apostrophes, also escape singe quotes in a string by doubling them
        if isinstance(x, str):
            row_str = row_str + "'" + str(x).replace("'", "''") + "', "
        # Dates and datetimes must be enclosed in apostrophes
        elif isinstance(x, datetime.datetime) or isinstance(x, datetime.date):
            row_str = row_str + "'" + str(x) + "', "
        # If x is NoneType then str(x) get transtlated to "None", but sql wants "null"
        elif x is None:
            row_str = row_str + "null, "
        # If x is bytes we need to make them nice (start with \x and append the data converted to hex):
        elif isinstance(x, bytes):
            row_str = row_str + "'\\x" + str(x.hex()) + "', "
        else:
            row_str = row_str + str(x) + ", "
    row_str = row_str[:-2] + ")"
    return row_str

# When not migrating historical data, this function figures out what colums "ValidityTo" is so we can later check for
# each row if it is still valid or already historical
def getValidityIndex(rows):
    vi = -1
    try:
        # rows is a list of tuples. This seems to be the easiest way to get an index out of a list of tuples
        vi = [x[0] for x in rows].index("ValidityTo")
    # ValueError occurs if no result has been found. It's fine when that happens
    except ValueError:
        pass
    # Sometimes, the row is called validity_to. Only check if the first bit didn't give a result
    if vi == -1:
        try:
            vi = [x[0] for x in rows].index("validity_to")
        except ValueError:
            pass
    return vi

# This function checks wether
def getValidity(vi, row):
    if historical or ((not historical) and vi == -1):
        return True
    elif (not historical) and vi != -1:
        # validity is stored as some form of date.
        # I cover my bases by checking for a datetime (with time of day) and a date (without time of day)
        if type(row[vi]) == datetime.datetime:
            if row[vi] > now:
                return True
            else:
                return False
        elif type(row[vi]) == datetime.date:
            if row[vi] > today:
                return True
            else:
                return False
        # else usually happens when ValidityTo is NoneType (meaning no expiration date is set). This means
        # that the data must be migrated anyway (no expiration date = it's still valid).
        else:
            return True

def migrate():
    # This list collects all db tables that exist only in one of the databases but not the other.
    lonely_tables = list()
    tables = getTablesFromFile()
    (old_tables, new_tables) = getDBTables()
    print("Starting migration transaction:")
    # Defer all constraint checking to make sure that cross-dependencies are satisfied
    new_cursor.execute("SET CONSTRAINTS ALL DEFERRED;")
    for table in tables:
        # We only migrate if a table exists in both databases
        if table in new_tables and table in old_tables:
            print("  Migrating table " + table + ":")
            # delete all data from this table in the new DB
            if delete_data:
                print("    Cleaning up table " + table + " in new database.")
                new_cursor.execute("DELETE FROM \"" + table + "\";")
                if table == "tblFeedback" and demo_fix:
                    new_cursor.execute("insert into \"" + table + "\" (\"ValidityFrom\", \"FeedbackID\", " +\
                            "\"FeedbackUUID\", \"AuditUserID\") VALUES ('2000 01 01 00:00:00.000000', 0, 0, 0);")

            # Set up all the columns we're going to migrate.
            new_cursor.execute("SELECT COLUMN_NAME FROM information_schema.COLUMNS WHERE TABLE_NAME = '" + table + "';")
            rows = new_cursor.fetchall()
            # While we have the data ready: find out where dates are stored for historical data stuff. validity_index
            # stores in which column the date (ValidityTo) is stored
            validity_index = -1
            if not historical:
                validity_index = getValidityIndex(rows)
            # Finally, setup the columns to migrate
            old_cols = ""
            new_cols = "("
            for row in rows:
                old_cols = old_cols + str(row)[2:-3] + ", "
                new_cols = new_cols + "\"" + str(row)[2:-3] + "\", "
            old_cols = old_cols[:-2]
            new_cols = new_cols[:-2] + ")"

            # Get the data from the old db with these column specifications
            print("    Fetching data from old database.")
            old_cursor.execute("SELECT COUNT(*) FROM " + table + ";")
            print("    Found " + str(old_cursor.fetchone())[1:-3] + " entries.")
            old_cursor.execute("SELECT " + old_cols + " FROM " + table + ";")

            # Set up the values for the insert statement and execute
            print("    Moving data to new database.")
            for row in old_cursor:
                # row_str contains all the data in sql format for the insert statement.
                # We have to adapt the raw data to comply with postgres' syntax.
                row_str = generateInsertionString(row)
                # A boolean is used to check wether this row needs to be migrated (because of historical data settings)
                # The boolean value is generated in the getValidity function
                if getValidity(validity_index, row):
                    try:
                        new_cursor.execute("INSERT INTO \"" + table + "\" " + new_cols + " VALUES " + row_str + ";")
                    except psycopg2.errors.UniqueViolation as e:
                        print("\x1b[0;31;48m" + e.pgerror + "\x1b[0m\n")
                        # Not rolling back leads to an InFailedSqlTransaction exception.
                        new_connection.rollback()
                        pass

            print("  Table " + table + " has been migrated.\n")

        # Table doesn't exist
        else:
            print("\x1b[0;31;48m" + "WARNING: Table " + table + \
                  " only exists in one of the databases (but not the other)! Is this correct?" + "\x1b[0m\n")
            print("")
            lonely_tables.append(table)

    # Print all tables that have not been migrated due to missing schemas:
    if len(lonely_tables) != 0:
        print("The following tables do not exist in one of the databases and therefore have not been migrated:")
        i = 1
        for x in lonely_tables:
            print("    {:0>2d}".format(i) + ": " + x)
            i += 1
    else:
        print("There were no missing tables. All tables have been migrated.")

    # Finally, commit the transaction and close the connections
    print("\nCommiting transaction.")
    new_cursor.execute("COMMIT;")
    print("Closing Connections.")
    old_cursor.close()
    new_cursor.close()
    old_connection.close()
    new_connection.close()
    print("Database migration is complete.")
    # Print time taken to finish the job

if __name__ == "__main__":
    # start_time is used to calculate how long the migration takes.
    start_time = time.time()
    getSettingsFromFile()
    connect()
    migrate()
    print("Time taken (h:m:s): " + str(datetime.timedelta(seconds=time.time() - start_time)))
