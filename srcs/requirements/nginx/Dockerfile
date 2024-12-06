#-----------------OS LAYER----------------#
FROM debian:bullseye
#-----------------------------------------#

#-------------IMAGE METADATA--------------#
LABEL version="1.0" maintainer="vstineau"
#-----------------------------------------#

#-------------INSTALL NGINX---------------#
RUN apt-get update -y && apt-get upgrade -y && apt-get install -y nginx
#&& echo "include /etc/nginx/sites-enabled/*;" >> /etc/nginx/nginx.conf
#-----------------------------------------#

#-------------CONFIGURE NGINX-------------#
COPY nginxconfig /etc/nginx/sites-enabled/
#-----------------------------------------#

#-------------lISTEN PORT 443-------------# PORT 443 = https (80 = http) https is more secure
EXPOSE 443
#-----------------------------------------#

#-------------SET VOLUME DIRECTORY--------#
VOLUME $HOME/data
#-----------------------------------------#

#"daemons on" means nginx is running in the background but because we have one docker dedicated
#to nginx we want nginx to run in the foreground also docker closes when there is no task
#in the foreground so if nginx is running in the background the docker will close
CMD ["nginx", "-g", "daemon off"]
