#!/bin/bash
set -e

if [ ! -d "/var/lib/mysql/mysql" ]; then
  echo "Initializing database structure..."
  mysqld --initialize-insecure --user=mysql --datadir=/var/lib/mysql
fi

cat > /tmp/init.sql <<EOSQL
CREATE DATABASE IF NOT EXISTS ${DB_NAME};
CREATE USER '${DB_USER}'@'%' IDENTIFIED BY '${DB_PASSWORD}';
GRANT ALL PRIVILEGES ON ${DB_NAME}.* TO '${DB_USER}'@'%';

CREATE USER '${DB_USER2}'@'%' IDENTIFIED BY '${DB_USER2_PASSWORD}';
GRANT SELECT, INSERT, UPDATE, DELETE ON ${DB_NAME}.* TO '${DB_USER2}'@'%';

EOSQL

echo "Starting MariaDB in foreground..."
exec mysqld --init-file=/tmp/init.sql
