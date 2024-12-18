#-----------------OS LAYER-----------------------------#
FROM debian:bullseye
#------------------------------------------------------#

#--------------IMAGE METADATA--------------------------#
LABEL version="1.0" maintainer="vstineau"
#------------------------------------------------------#

#--------INSTALL PHP-FPM + CURL -----------------------#
RUN apt-get update -y && apt-get install -y \
		php7.4 \
		php7.4-fpm \
		php7.4-opcache \
		php7.4-mysqli \
		curl \
		unzip \
		&& rm -rf /var/lib/apt/lists/* #delete the cache
#------------------------------------------------------#

#-------------INSTALL WORDPRESS CLI -------------------#
RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar \
	&& chmod +x wp-cli.phar \
	&& mv wp-cli.phar /usr/local/bin/wp
#------------------------------------------------------#

COPY php.ini /etc/php/7.4/cli/

COPY wordpress_setup.sh ~/

#---------------lISTEN PORT 9000-----------------------#
EXPOSE 9000
#------------------------------------------------------#

ENTRYPOINT ["sh", "~/wordpress_setup.sh"]

# -F is for launch php in foreground to keep the docker running
CMD ["php-fpm7.4", "-F"]
