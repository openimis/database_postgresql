FROM postgres:13-alpine

# Script to detect whether the database has finished initializing
COPY ["true_isready.sh", "/usr/local/bin/"]
COPY ["database scripts/00_dump.sql", "database scripts/0[2345]_*.sql", "database scripts/demo_db.sql", "/docker-entrypoint-initdb.d/"]
