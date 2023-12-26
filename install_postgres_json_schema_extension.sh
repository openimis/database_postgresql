#!/bin/bash
apk add --update make
apk add --update git

# Clone the repository
git clone https://github.com/gavinwahl/postgres-json-schema/

apk add libpq-dev
# Move into the directory
cd postgres-json-schema

# Build the extension
make & make install


apk add postgresql-client

/bin/mkdir -p '/usr/local/share/postgresql/extension'

chmod 666 /usr/local/share/postgresql/extension/postgres-json-schema.control
