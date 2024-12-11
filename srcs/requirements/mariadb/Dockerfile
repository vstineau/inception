
#-----------------OS LAYER----------------#
FROM debian:bullseye
#-----------------------------------------#

#-------------IMAGE METADATA--------------#
LABEL version="1.0" maintainer="vstineau"
#-----------------------------------------#

#------------INSTALL MARIADB--------------#
RUN apt-get update -y && apt-get install -y mariadb-server \
		&& rm -rf /var/lib/apt/lists/* #delete the cache
#-----------------------------------------#

#------------CONFIGURE MARIADB------------#
#COPY mariadbconfig
#-----------------------------------------#

COPY mariadb_setup.sh ~/

#-------------lISTEN PORT 3306------------#
EXPOSE 3306
#-----------------------------------------#


ENTRYPOINT ["sh", "~/mariadb_setup.sh"]

#-----------------------------------------#
CMD ["mariadbd"]

