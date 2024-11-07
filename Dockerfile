#https://github.com/supabase/pg_jsonschema/blob/master/dockerfiles/db/Dockerfile
FROM postgres:16 as base
RUN apt-get update

ENV build_deps ca-certificates \
  git \
  build-essential \
  libpq-dev \
  postgresql-server-dev-16 \
  curl \
  libreadline6-dev \
  zlib1g-dev


RUN apt-get install -y --no-install-recommends $build_deps pkg-config cmake

WORKDIR /home/supa

ENV HOME=/home/supa \
  PATH=/home/supa/.cargo/bin:$PATH
RUN chown postgres:postgres /home/supa
USER postgres

RUN \
  curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y --no-modify-path --profile minimal --default-toolchain stable && \
  rustup --version && \
  rustc --version && \
  cargo --version

# PGX
RUN cargo install cargo-pgrx --version 0.12.6 --locked

RUN cargo pgrx init --pg16 $(which pg_config)

USER root

COPY . .
RUN cargo pgrx install

RUN chown -R postgres:postgres /home/supa
RUN chown -R postgres:postgres /usr/share/postgresql/16/extension
RUN chown -R postgres:postgres /usr/lib/postgresql/16/lib

USER postgres

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
