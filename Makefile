all:
	mkdir --parents ~/data/mariadb ~/data/wordpress
	docker compose -f srcs/docker-compose.yml up 
clean:
	rm -rf ~/data/mariadb ~/data/wordpress

prune:
	docker system prune -a -f --volumes
