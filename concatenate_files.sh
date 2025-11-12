#!/bin/bash

mkdir output
cd database\ scripts
cat 00_dump.sql 0[2345]_*.sql ../scripts/demo_db.sql > ../output/fullDemoDatabase.sql
cat 00_dump.sql 0[2345]_*.sql > ../output/EmptyDatabase.sql
