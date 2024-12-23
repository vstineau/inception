#!/bin/bash

set -e

if [[ ! -d "/var/lib/mysql/$MYSQL_DATABASE" ]]; then 

				mariadb-install-db --user=mysql
				
				service mariadb start
				
				mysql -e "create database \`${MYSQL_DATABASE}\`;"
				
				mysql -e "create user '${MYSQL_USER}'@'localhost' identified by '${MYSQL_PASSWD}';"
				
				mysql -e "grant all privileges on DATABASE_NAME.* TO '${MYSQL_USER}'@'localhost';"
				
				mysql -e "flush privileges;"

fi

exec "$@"

