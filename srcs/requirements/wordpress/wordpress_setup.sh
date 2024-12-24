#set -e #premier commande qui fail quite le scritp

if [ ! -f "/var/www/html/wp-config.php" ]; then 

wp-cli.phar core --allow-root download --path="/var/www/html"

#rm /var/www/html/wp-config-sample.php

wp-cli.phar config create --allow-root --dbname=$MYSQL_DATABASE --dbuser=$MYSQL_USER --dbpass=$MYSQL_PASSWD --url=$DOMAIN_NAME --dbhost="mariadb" --skip-check --path="/var/www/html"

wp-cli.phar core install --allow-root --url=$DOMAIN_NAME --title=$SITE_NAME --admin_user=$ADMIN_NAME --admin_password=$ADMIN_PASSWD --admin_email=$ADMIN_EMAIL --path="/var/www/html"

wp-cli.phar user create --allow-root $WP_USER $WP_USER_EMAIL --user_pass=$WP_USER_PASSWD --path="/var/www/html"

fi

exec "$@"

