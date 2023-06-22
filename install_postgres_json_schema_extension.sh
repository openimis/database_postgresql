#!/bin/bash
apk add --update apt
apk add --update make
apk add --update git

# Clone the repository
git clone https://github.com/gavinwahl/postgres-json-schema/

apt install libpq-dev -y
# Move into the directory
cd postgres-json-schema

# Build the extension
make & make install


apt install postgresql-client -y

/bin/mkdir -p '/usr/local/share/postgresql/extension'

