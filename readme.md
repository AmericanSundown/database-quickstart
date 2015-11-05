Database Quickstart
===================

Get started with various databases quickly using [Vagrant](https://www.vagrantup.com/) and a simple provisioning script.

## Getting Started
Make sure you've [got Vagrant installed](https://docs.vagrantup.com/v2/installation/). Also install the client library for the database you intend to use.

## PostgreSQL
Fire up an instance of [PostgreSQL](http://www.postgresql.org/)

    cd postgresql
    vagrant up
    psql --username admin --dbname testdb --host 127.0.0.1 --port 54320

## MySQL
Fire up an instance of [MySQL](https://www.mysql.com/)

    cd mysql
    vagrant up
    mysql --user admin --password --host 127.0.0.1 --port 33060

Note that the database is completely insecure. These are intended for testing purposes only.

##License and Copyright

See [LICENSE](https://github.com/chrishalebarnes/database-quickstart/blob/master/LICENSE)
