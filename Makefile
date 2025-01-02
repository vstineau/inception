# http://web.archive.org/web/20210417155649/https://cloud.google.com/architecture/best-practices-for-building-containers

all:
	mkdir --parents ~/data/mariadb ~/data/wordpress
	docker-compose -f srcs/docker-compose.yml up -d --build 

down:
	docker-compose -f srcs/docker-compose.yml down 

clean:
	docker-compose -f srcs/docker-compose.yml down 
	sudo rm -rf  ~/data/mariadb ~/data/wordpress

prune:
	docker system prune -a -f --volumes
