#-----------------OS LAYER----------------#
FROM debian:bullseye
#-----------------------------------------#

#-------------IMAGE METADATA--------------#
LABEL version="1.0" maintainer="vstineau"
#-----------------------------------------#

#-------------INSTALL NGINX---------------#
RUN apt-get update -y && apt-get install -y nginx
#-----------------------------------------#

#-------------CONFIGURE NGINX-------------#
COPY nginxconfig /etc/nginx/sites-enabled/
