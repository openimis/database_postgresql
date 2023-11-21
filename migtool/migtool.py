import re

import pyodbc           # adapter for SQL Server
import psycopg2         # adapter for PostgreSQL
import configparser     # used to read settings from file
import datetime         # used to properly format dates and datetimes
import time             # used to calculate time taken

# This script was created with global variables without initializing them here. Ideally, we should store a settings
# object rather than all of them separately but this works.
settings = None
EXCLUDED_COLUMNS = ["RowID"]
delete_data = False
historical = False
demo_fix = False
migration_modules = []
old_connection = None
new_connection = None
today = datetime.date.today()
now = datetime.datetime.now()


# loads connection configuration and migration settings from a file.
# In future the settings file could be specified with a parameter.
def get_settings_from_file():
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
        global migration_modules
        migration_modules = settings["Other"].get("migration_modules", "").split(",")
        if delete_data:
            print("  Tables in the new database will be emptied before migrating data.")
        else:
            print("  Migration data will be appended to the tables in the new database (existing data persists).")
        if historical:
            print("  Histrical data will be migrated to the new database.")
        else:
            print("  No historical data will be migrated.")
    except KeyError as e:
        print("\x1b[0;31;48m" + "Error while trying to load settings. " +\
              "Please make sure the settings.ini file exists in your working directory." + "\x1b[0m")
        exit(1)


# tries to connect to both databases
def connect():
    print("Setting up connection to the databases:")
    # Establish a connection to the SQL Server Database
    old_connection_string = f"Driver={{ODBC Driver 17 for SQL Server}};Server={settings['OldDB']['host']}," \
                            f"{settings['OldDB']['port']};Database={settings['OldDB']['name']};UID=" \
                            f"{settings['OldDB']['user']};PWD={settings['OldDB']['pwd']};"
    try:
        global old_connection
        old_connection = pyodbc.connect(old_connection_string)
    except pyodbc.InterfaceError as exc:
        print("\x1b[0;31;48m"
              "ERROR: Could not connect to the SQL Server database. "
              "Make sure the server is running and check your settings."
              "\x1b[0m")
        print(exc)
        exit(1)
    print("  Connection to SQL Server database established.")

    # Establish a connection the PostgreSQL Database
    new_db = settings["NewDB"]
    new_connection_string = f'host={new_db["host"]} port={new_db["port"]} dbname={new_db["name"]} ' \
                            f'user={new_db["user"]} password={new_db["pwd"]}'
    # new_connection_string = \
    #      f'postgres://{new_db["user"]}:{new_db["pwd"]}@{new_db["host"]}:{new_db["port"]}/{new_db["name"]}'
    try:
        global new_connection
        new_connection = psycopg2.connect(new_connection_string)
    except psycopg2.OperationalError as exc:
        print("\x1b[0;31;48m"
              "ERROR: Could not connect to the PostgreSQL database. "
              "Make sure the server is running and check your settings."
              "\x1b[0m")
        print(exc)
        exit(1)

    # Make cursors for each database
    global old_cursor
    old_cursor = old_connection.cursor()
    global new_cursor
    new_cursor = new_connection.cursor()
    print("  Connection to PostgreSQL database established.\n")


# get an ordered list of all tables from a file
def get_tables_from_file():
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
def get_db_tables():
    # Get a list of all tables in each database
    print("Finding tables in both databases.\n")
    old_cursor.execute("SELECT TABLE_NAME FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_TYPE = 'BASE TABLE';")
    new_cursor.execute("SELECT table_name FROM information_schema.tables WHERE table_schema = 'public';")
    old_tables = [x[0] for x in old_cursor]
    new_tables = [x[0] for x in new_cursor]
    return old_tables, new_tables


# This function puts the data from a SELECT statement into string and formats it correctly so that postgres can work
# with it.
def generate_insertion_string(row):
    row_list = []
    for x in row:
        # Strings must be enclosed in apostrophes, also escape singe quotes in a string by doubling them
        if isinstance(x, str):
            row_list.append("'" + str(x).replace("'", "''") + "'")
        # Dates and datetimes must be enclosed in apostrophes
        elif isinstance(x, datetime.datetime) or isinstance(x, datetime.date):
            row_list.append("'" + str(x) + "'")
        # If x is NoneType then str(x) get translated to "None", but sql wants "null"
        elif x is None:
            row_list.append("null")
        # If x is bytes we need to make them nice (start with \x and append the data converted to hex):
        elif isinstance(x, bytes):
            row_list.append("'\\x" + str(x.hex()) + "'")
        else:
            row_list.append(str(x))
    row_str = f"({', '.join(row_list)})"
    return row_str


# When not migrating historical data, this function figures out what columns "ValidityTo" is so we can later check for
# each row if it is still valid or already historical
def get_validity_index(rows):
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


def get_validity(vi, row):
    global today
    global now
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


def extract_sequence_name(column_default):
    if not column_default:
        return None
    pattern = r"nextval\('([^']*)"
    match = re.search(pattern, column_default)
    if match:
        return match.group(1)
    else:
        return None


def migrate():
    # This list collects all db tables that exist only in one of the databases but not the other.
    lonely_tables = list()
    tables = get_tables_from_file()
    (old_tables, new_tables) = get_db_tables()
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
                    new_cursor.execute("insert into \"" + table + "\" (\"ValidityFrom\", \"FeedbackID\", " +
                            "\"FeedbackUUID\", \"AuditUserID\") VALUES ('2000 01 01 00:00:00.000000', 0, 0, 0);")

            # Set up all the columns we're going to migrate.
            new_cursor.execute("SELECT COLUMN_NAME, COLUMN_DEFAULT "
                               "FROM information_schema.COLUMNS WHERE TABLE_NAME = '" + table + "';")
            rows = new_cursor.fetchall()
            # While we have the data ready: find out where dates are stored for historical data stuff. validity_index
            # stores in which column the date (ValidityTo) is stored
            validity_index = -1
            if not historical:
                validity_index = get_validity_index(rows)
            # Finally, set up the columns to migrate
            sequence_columns = {}
            old_cols_list = []
            new_cols_list = []
            for row in rows:
                if row[0] not in EXCLUDED_COLUMNS:
                    col_default = extract_sequence_name(row[1])
                    if col_default:
                        sequence_columns[row[0]] = col_default
                    old_cols_list.append(row[0])
                    new_cols_list.append(f'"{row[0]}"')
            old_cols = ", ".join(old_cols_list)
            new_cols = "(" + ", ".join(new_cols_list) + ")"

            # Get the data from the old db with these column specifications
            print("    Fetching data from old database.")
            old_cursor.execute("SELECT COUNT(*) FROM " + table + ";")
            print(f"    Found {old_cursor.fetchone()[0]} entries.")
            print(f"    == old_cols: {old_cols} from {table} ==")
            old_cursor.execute("SELECT " + old_cols + " FROM " + table + ";")

            # Set up the values for the insert statement and execute
            print("    Moving data to new database.")
            for row in old_cursor:
                if table == "django_migrations" and row[1] not in migration_modules:
                    print(f"migration {row[1]}:{row[2]} skipped from transfer")

                # row_str contains all the data in sql format for the insert statement.
                # We have to adapt the raw data to comply with postgres' syntax.
                row_str = generate_insertion_string(row)
                # A boolean is used to check whether this row needs to be migrated (because of historical data settings)
                # The boolean value is generated in the getValidity function
                if get_validity(validity_index, row):
                    try:
                        new_cursor.execute("INSERT INTO \"" + table + "\" " + new_cols + " VALUES " + row_str + ";")
                    except psycopg2.errors.UniqueViolation as e:
                        print("\x1b[0;31;48m" + e.pgerror + "\x1b[0m\n")
                        # Not rolling back leads to an InFailedSqlTransaction exception.
                        new_connection.rollback()
                        pass
                    except Exception as e:
                        print("Failed: INSERT INTO \"" + table + "\" " + new_cols + " VALUES " + row_str + ";")
                        raise
            if sequence_columns:
                print("    Data transferred, updating sequences.")
                for column, sequence in sequence_columns.items():
                    new_cursor.execute(f"select setval('{sequence}', max(\"{column}\")) from \"{table}\";")
            print("  Table " + table + " has been migrated.\n")

        # Table doesn't exist
        else:
            print(f"\x1b[0;31;48mWARNING: Table {table} only exists in one of the databases "
                  f"new: {table in new_tables}, old:{table in old_tables})! Is this correct?\x1b[0m\n")
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
    print("\nCommitting transaction.")
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
    get_settings_from_file()
    connect()
    migrate()
    print("Time taken (h:m:s): " + str(datetime.timedelta(seconds=time.time() - start_time)))
