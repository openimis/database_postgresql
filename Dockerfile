FROM postgres:13-alpine as base

# Script to detect whether the database has finished initializing
COPY ["true_isready.sh", "/usr/local/bin/"]
COPY ["database scripts/00_dump.sql", "database scripts/0[2345]_*.sql", "database scripts/json_schema_extension.sql", "/docker-entrypoint-initdb.d/"]

# Install https://github.com/gavinwahl/postgres-json-schema/
# extension that allows validation of jsonb fields against jsonschema 
COPY ["install_postgres_json_schema_extension.sh", "install_postgres_json_schema_extension.sh"]
RUN chmod u+x install_postgres_json_schema_extension.sh
RUN ./install_postgres_json_schema_extension.sh

FROM base as demo
COPY ["database scripts/demo_db.sql", "/docker-entrypoint-initdb.d/"]
