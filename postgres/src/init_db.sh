#!/bin/bash

set -e

# Add new database credentials 
psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER"  --dbname "$POSTGRES_DB" <<-EOSQL
    CREATE USER gitea WITH password 'SecretDatabasePassword';
    CREATE DATABASE gitea OWNER gitea;
    GRANT ALL PRIVILEGES ON DATABASE gitea TO gitea;
EOSQL
