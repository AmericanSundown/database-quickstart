#!/bin/bash

# Note: This setup is for testing only and is very insecure
apt-get update                                                                              # Update repositories
apt-get --yes install mysql-client                                                          # Install MySQL client
echo mysql-server mysql-server/root_password select password | debconf-set-selections       # Set password for root user
echo mysql-server mysql-server/root_password_again select password | debconf-set-selections
apt-get --yes install mysql-server                                                          # Install MySQL Server
mysql --user root --password=password --execute='create database if not exists testdb;'     # Create testdb database
mysql --user root --password=password --execute="create user 'admin' identified by 'password';"
mysql --user root --password=password --execute="grant all privileges on testdb.* to 'admin' with grant option;"
sed -i "s/bind-address.*/bind-address = 0.0.0.0/" /etc/mysql/my.cnf                         # Listen on all ip addresses
service mysql restart                                                                  # Restart

# Now login like this:
# mysql --host 127.0.0.1 --port 33060 --user admin --password=password
