
#-----------------OS LAYER----------------#
FROM debian:bullseye
#-----------------------------------------#

#-------------IMAGE METADATA--------------#
LABEL version="1.0" maintainer="vstineau"
#-----------------------------------------#

#-------------INSTALL NGINX---------------#
RUN apt-get update -y && apt-get install -y mariadb 
#-----------------------------------------#

#-------------CONFIGURE MARIADB-------------#
COPY mariadbconfig
#-----------------------------------------#

#-------------lISTEN PORT 3306-------------#
EXPOSE 3306
#-----------------------------------------#

#-------------SET VOLUME DIRECTORY--------#
VOLUME $HOME/data
#-----------------------------------------#

ENTRYPOINT ["", ""]

CMD ["", "", ""]
