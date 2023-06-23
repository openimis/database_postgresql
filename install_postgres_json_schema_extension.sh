#!/bin/bash
apk add --update apt
apk add --update make
apk add --update git

# Clone the repository
git clone https://github.com/gavinwahl/postgres-json-schema/

apk install libpq-dev
# Move into the directory
cd postgres-json-schema

# Build the extension
make & make install


apk install postgresql-client

/bin/mkdir -p '/usr/local/share/postgresql/extension'

chmod 666 /usr/local/share/postgresql/extension/postgres-json-schema.control
# Add extension to PostgreSQL
# Assuming you're operating in the psql shell
psql -U $POSTGRES_USER -d $POSTGRES_DB -c "CREATE EXTENSION \"postgres-json-schema\";"
