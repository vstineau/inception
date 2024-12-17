#-----------------OS LAYER-----------------------------#
FROM alpine:3.20
#------------------------------------------------------#

#--------------IMAGE METADATA--------------------------#
LABEL version="1.0" maintainer="vstineau"
#------------------------------------------------------#

#--------INSTALL PHP-FPM + CURL -----------------------#
RUN apk update -y && apk ugrade -y && apk add --no-cache -y \
	php7.3 \
	php-fpm \
	curl
#------------------------------------------------------#

#-------------INSTALL WORDPRESS CLI -------------------#
RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar \
	&& chmod +x wp-cli.phar \
	&& mv wp-cli.phar /usr/local/bin/wp
#------------------------------------------------------#


#---------------lISTEN PORT 9000-----------------------#
EXPOSE 9000
#------------------------------------------------------#

ENTRYPOINT ["sh", "~/wordpress_setup.sh"]

# -F is for launch php in foreground to keep the docker running
CMD ["php-fpm7.4", "-F"]
