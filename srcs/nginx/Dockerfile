#-----------------OS LAYER----------------#
FROM debian:bullseye
#-----------------------------------------#

#-------------IMAGE METADATA--------------#
LABEL version="1.0" maintainer="vstineau"
#-----------------------------------------#

#-------------INSTALL NGINX---------------#
RUN apt-get update -y && apt-get install -y nginx 
&& echo "include /etc/nginx/sites-enabled/*;" >> /etc/nginx/nginx.conf
#-----------------------------------------#

#-------------CONFIGURE NGINX-------------#
COPY nginxconfig /etc/nginx/sites-enabled/
#-----------------------------------------#

#-------------lISTEN PORT 443-------------#
EXPOSE 443
#-----------------------------------------#

#-------------SET VOLUME DIRECTORY--------#
VOLUME ~/inception/srcs/nginx
#-----------------------------------------#

WORKDIR ~/inception/srcs/nginx
