FROM postgres:13-alpine

ENV POSTGRES_DB imis

COPY ["database scripts/00_dump.sql", "database scripts/0[2345]_*.sql", "database scripts/demo_db.sql", "/docker-entrypoint-initdb.d/"]
