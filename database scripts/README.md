# database scripts
In this directory all scripts to create the openIMIS database in PostgreSQL can be found.


## Contents of the Folder
This folder contains six sql scripts. They are numbered 00 though 05.

File 00_dump.sql is a schema dump. It contains all 84 tables, all 34 views, all 23 functions, and the 3 (of 100 total) 
stored procedures that have been migrated to PostgreSQL during the Bachelor's thesis. There is also a number of auxiliary 
functions that are accessed by views and functions (such as the YEAR() and MONTH() functions from SQL Server that 
PostgreSQL does not have).

If You're using Django to create the basic database and only need the stuff that is missing, You can instead use the 
other five scripts. They contain everything that Django did not do (at this time). Here's what's in them:
* 01_missing_tables: Django only has definitions for 64 of the 84 tables. The missing 20 tables have been migrated 
manually with this script.
* 02_aux_functions: Views, functions, and procedures require some SQL Server System functions (such as the YEAR() or 
DateDiff() functions). These have been recreated in a (hopefully) well-performing manner and can be found here
* 04_functions: This script contains all 23 functions migrated to PostgreSQL.
* 05_stored_procs: This files contains the thre (of 100 total) stored procedures that have been migrated to PostgreSQL.