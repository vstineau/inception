#set -e #premiere commande qui fail quite le scritp

if [ ! -f "/var/www/html/wp-config.php" ]; then 

cd /var/www/html

wp core --allow-root download --path="/var/www/html"

wp config create --allow-root \
				--dbname=$MYSQL_DATABASE \
				--dbuser=$MYSQL_USER  \
				--dbpass=$MYSQL_PASSWD \
				--url=$DOMAIN_NAME  \
				--dbhost="mariadb" \
				--skip-check   \
				--path="/var/www/html" 

wp core install --allow-root \
				--url=$DOMAIN_NAME  \
				--title=$SITE_NAME  \
				--admin_user=$ADMIN_NAME  \
				--admin_password=$ADMIN_PASSWD  \
				--admin_email=$ADMIN_EMAIL  \
				--path="/var/www/html"

wp user create --allow-root $WP_USER $WP_USER_EMAIL --user_pass=$WP_USER_PASSWD --path="/var/www/html"

fi

exec "$@"

