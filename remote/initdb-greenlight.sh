#!/bin/sh

set -e

export PGUSER="$POSTGRES_USER"

psql -c "CREATE DATABASE $APP_POSTGRES_DB;"
psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" --dbname "$APP_POSTGRES_DB" <<-EOSQL
	CREATE ROLE $APP_POSTGRES_USER WITH LOGIN PASSWORD '$APP_POSTGRES_PASSWORD';
	GRANT ALL PRIVILEGES ON DATABASE $APP_POSTGRES_DB TO $APP_POSTGRES_USER;
    CREATE EXTENSION IF NOT EXISTS citext;
EOSQL