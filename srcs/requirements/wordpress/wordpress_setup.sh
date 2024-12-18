#set -e #premier commande qui fail quite le scritp

if [ ! -d "/var/www/" ]; then 

wp core --allow-root download

wp config create --allow-root --dbname=$MYSQL_DATABASE --dbuser=$MYSQL_USER --dbpass=$MYSQL_PASSWD --dbhost=mariadb:3306 

wp core install --allow-root --url=$DOMAIN_NAME --title=$SITE_NAME --admin_user=$ADMIN_NAME --admin_password=$ADMIN_PASSWD --admin_email=$ADMIN_EMAIL

wp user create --allow-root $WP_USER $WP_USER_EMAIL --user_pass=$WP_USER_PASSWD

fi

exec "$@"

