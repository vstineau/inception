#!/bin/bash

#set -e

if [ ! -d "/var/lib/mysql/$MYSQL_DATABASE" ]; then 

				mariadb-install-db --user=mysql
				
				service mariadb start
				
				mysql -e "CREATE DATABASE IF NOT EXISTS ${MYSQL_DATABASE};"
				
				mysql -e "CREATE USER IF NOT EXISTS '${MYSQL_USER}'@'localhost' IDENTIFIED BY '${MYSQL_PASSWD}';"
				mysql -e "GRANT ALL PRIVILEGES ON ${MYSQL_DATABASE}.* TO '${MYSQL_USER}'@'%'localhost';"
				
				mysql -e "FLUSH PRIVILEGES;"

fi

exec "$@"

