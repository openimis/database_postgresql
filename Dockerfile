# syntax=docker/dockerfile:1.4

FROM alpine:3.19 AS downloader
RUN apk add --no-cache git
RUN git clone https://github.com/supabase/pg_jsonschema.git
WORKDIR /pg_jsonschema
RUN ln -s dockerfiles/db/Dockerfile Dockerfile.pg_jsonschema

FROM scratch AS pg_jsonschema
COPY --from=downloader /pg_jsonschema /

FROM pg_jsonschema AS base

# Script to detect whether the database has finished initializing
COPY ["true_isready.sh", "/usr/local/bin/"]
COPY ["database scripts/00_dump.sql", "database scripts/0[2345]_*.sql", "database scripts/json_schema_extension.sql", "/docker-entrypoint-initdb.d/"]

# Install https://github.com/gavinwahl/postgres-json-schema/
# extension that allows validation of jsonb fields against jsonschema 
COPY ["install_postgres_json_schema_extension.sh", "install_postgres_json_schema_extension.sh"]
RUN chmod u+x install_postgres_json_schema_extension.sh
RUN ./install_postgres_json_schema_extension.sh

FROM base AS demo
COPY ["database scripts/demo_db.sql", "/docker-entrypoint-initdb.d/"]
