#-----------------OS LAYER----------------#
FROM debian:bullseye
#-----------------------------------------#

#-------------IMAGE METADATA--------------#
LABEL version="1.0" maintainer="vstineau"
#-----------------------------------------#

#-------------INSTALL NGINX---------------#
RUN apt-get update -y && apt-get upgrade -y && apt-get install -y \
		nginx \
		netcat \
		openssl \
		&& rm -rf /var/lib/apt/lists/* #delete the cache
#-----------------------------------------#

#-----CREATE CETRIFICATE AND KEY ---------#
RUN mkdir -p /etc/nginx/ssl && openssl req  -x509 -new -newkey rsa:4096 -nodes -days 3650 \
		-out /etc/nginx/ssl/certificate.pem \
		-keyout /etc/nginx/ssl/key.pem \
		-subj "/C=FR/ST=/L=Paris/O=42/CN=vstineau.42.fr" \
		&& chmod +rwx /etc/nginx/ssl/certificate.pem

#-------------CONFIGURE NGINX-------------#
COPY nginx.conf /etc/nginx/conf.d/
#-----------------------------------------#

#-------------lISTEN PORT 443-------------# PORT 443 = https (80 = http) https is more secure
EXPOSE 443
#-----------------------------------------#

#"daemons on" means nginx is running in the background but because we have one docker dedicated
#to nginx we want nginx to run in the foreground also docker closes when there is no task
#in the foreground so if nginx is running in the background the docker will close
CMD ["nginx", "-g", "daemon off;"]
