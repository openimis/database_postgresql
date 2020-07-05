# database-data-migration_py
Migration tool to copy the data from MSSQL database to PostgreSQL database.

## Folders
The migration tool itself can be found in the "migtool" folder. In the "database scripts" folder are all the SQL scripts 
needed to create the openIMIS database schema in PostgreSQL. What follows here is a description of the migration tool.


## Prerequisites
The migration tool requires two packages to be installed.
* pyodbc
* psycopg2

You can install them with the command "pip install pyodbc psycopg2" or by using the provided requirements.txt file.


## Usage
The migration tool consists of three files:
* migtool.py - The python code of the script
* settings.ini - The tool's configuration file
* tables.txt - The list of all tables that need migrating

First You need to edit the settings.ini file to have the connections settings to both Your databases (the old SQL Server 
database and the new PostreSQL database). Then You can adjust the other settings in the file to Your liking. More on 
these settings below.

Unless Your database contains special tables that do not exist in regular OpenIMIS, You do not have to edit the 
tables.txt file. You will, however, need to keep it updated when you make changes to the OpenIMIS database structure 
(e.g. add new tables or remove existing ones). Please note that the migration tool's parser for this file is very 
primitive and does not support in line comments; either a line is a comment (it starts with "#") or it isn't. 

Now You can just run the migtool.py script. It connects to both databases and migrates data without further user input. 
It only performs read operations on Your old SQL Server database and thus should not cause any catastrophic failures in
the pre-existing server. The migration tool defers all deferrable constraint checks and it writes data using a 
transaction, meaning that when errors occur, no data will be written. Note that the migration tool looks for both the 
setting.ini and tables.txt files in Your current working directory. Make sure that they are present.

You may want to redirect console output to a file if You're interested in a proper log file. On Linux (and on Windows 
using PowerShell) this is particularly easy: use "./migtool.py > /path/to/logfile.log" (PowerShell uses backslashes 
instead of forward slashes).

The tool also checks whether a table that should be migrated exists in both databases. It lists which tables are missing 
near the end of the log.


## Settings
The settings.ini file has three categories: OldDB, NewDB, and Other. OldDB and NewDB just contain the connection 
settings of the two databases. Please keep in mind that the migration tool assumes that the old database is an SQL 
Server database and that the new database is a PostgreSQL database.

#### Database settings
For both of Your databases You need to provide the following settings:
* <b>host</b>: The host address of your database. Aliases such as "localhost" or "USER\SQLEXPRESS" should also work. 
* <b>port</b>: The port the database uses. Default port for SQL Server is 1433, for PostgreSQL it's 5432.
* <b>name</b>: The name of the database. E.g. OpenIMIS
* <b>user</b>: The user used to connect to the server. For the new database it obviously needs write permissions.
* <b>pwd</b>: The password of the chosen database user.

#### Other settings
There are three other settings:
* <b>delete_data</b>: This setting toggles whether data already present in Your new database should be deleted before 
trying to insert data from Your old database. As the migration tool does not alter primary keys and other unique keys, 
not deleting preexisting data in Your new database may lead to conflicts. Conflicts mean errors and errors mean that 
Your data will not be migrated.
* <b>historical</b>: This setting toggles whether outdated data will be migrated. Most tables in OpenIMIS have a column 
called "ValidityTo" (sometimes "validity_to"). If historical is set to True, all data will be migrated regardless of 
validity. But if set to False, the migration tool checks for any given row if the date present in the ValidityTo column 
is in the past. If this is the case it will not be migrated. This keeps the new database lean. However: There may be 
constraints that might be violated if some outdated data is missing. The migration tool has no way to check for this.
* <b>demo_fix</b>: Using version 1.4.0 of the OpenIMIS demo database I have encountered an issue where some rows in some 
tables have a foreign key constraint for the tblFeedback table where FeedbackID should be 0. However, this entry does 
not seem to exist in tblFeedback. As a quick and dirty fix the migration tool will add an entry with this FeedbackID to 
the table if demo_fix is set to True. I have not (yet) checked if I have messed up when setting up the OpenIMIS database 
and this key somehow got lost or if it is truly missing.


## A note on tables.txt
If maintainability ever becomes an issue, it is possible to change the migration tool so that it does not require a 
tables.txt file. The getDBTables() function already creates lists of all the tables in each database. The migration 
tool could be set up so that it just runs through one list of tables (e.g. "for table in old_tables:") and checks for 
each table if it exists in the other list of tables (e.g. "if table in new_tables:"). Then it would only try copying 
data if the table is there. This way you could make the tables.txt file unnecessary. However, using such an approach 
might have drawbacks: I have tried to order the list in tables.txt loosely on the order that Django migration 
establishes. If You re-order the list it may be possible that You run into an issue where a non-deferrable constraint 
will be violated because the order of tables to migrate is wrong. There's also the possibility that some tables that 
should exist are missing completely (from both databases). If no tables.txt is present to check against how would You 
ever know if that happens?