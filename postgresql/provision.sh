#!/bin/bash

# Note: This setup is for testing only and is very insecure
apt-get update                                                               # Update repositories
apt-get --yes install postgresql postgresql-contrib                          # Install PostgreSQL
su postgres -c "psql -c 'create database testdb;'"                           # Create testdb database
su postgres -c "createuser --superuser --echo admin"                         # Create admin user
su postgres -c "psql -c \"alter user admin with password 'password';\""      # Give admin a password
echo "listen_addresses = '*' " >> '/etc/postgresql/9.3/main/postgresql.conf' # Listen on all ip addresses
echo "host all all 0.0.0.0/0 md5" >> '/etc/postgresql/9.3/main/pg_hba.conf'  # Set password authentication on all
service postgresql restart                                                   # Restart PostgreSQL

# Now login like this:
# psql --host 127.0.0.1 --username admin --dbname testdb --port 54320
