.DEFAULT_GOAL := all

all:
	mkdir ~/data/mariadb ~/data/wordpress
	docker compose run

clean:
	rm -rf ~/data/mariadb ~/data/wordpress

prune:
	docker system prune -af
