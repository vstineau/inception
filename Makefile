all:
	mkdir --parents ~/data/mariadb ~/data/wordpress
	docker-compose -f srcs/docker-compose.yml up -d --build 
clean:
	docker-compose -f srcs/docker-compose.yml down 
	sudo rm -rf --no-preserve-root ~/data/mariadb ~/data/wordpress

prune:
	docker system prune -a -f --volumes
