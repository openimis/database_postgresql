#!/bin/bash

mkdir output
cd database\ scripts
cat 00_dump.sql 0[2345]_*.sql demo_db.sql > ../output/fullDemoDatabase.sql
