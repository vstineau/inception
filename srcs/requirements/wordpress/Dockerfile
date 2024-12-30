#-----------------OS LAYER-----------------------------#
FROM debian:bullseye
#------------------------------------------------------#

#--------------IMAGE METADATA--------------------------#
LABEL version="1.0" maintainer="vstineau"
#------------------------------------------------------#

#--------INSTALL PHP-FPM + CURL -----------------------#
RUN apt-get update -y && apt-get install -y \
		php \
		php-fpm \
		php-mysql \
		wget \
		vim \
		netcat \
		&& rm -rf /var/lib/apt/lists/* #delete the cache
#------------------------------------------------------#

RUN mkdir -p /var/run/php/ /var/www/html && chown -R  www-data:www-data /var/run/php/

#-------------INSTALL WORDPRESS CLI -------------------#
RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar \
  && chmod +x wp-cli.phar \
	&& mv wp-cli.phar /usr/local/bin/wp
#------------------------------------------------------#

COPY www.conf /etc/php/7.4/fpm/pool.d

COPY wordpress_setup.sh ~/

#---------------lISTEN PORT 9000-----------------------#
EXPOSE 9000
#------------------------------------------------------#

ENTRYPOINT ["sh", "~/wordpress_setup.sh"]

# -F is for launch php in foreground to keep the docker running
CMD ["php-fpm7.4", "-F"]
