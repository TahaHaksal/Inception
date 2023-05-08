DATA_DIR = /home/mhaksal/data

all: dir
	docker-compose -f srcs/docker-compose.yml --env-file=srcs/.env up -d --build
re: fclean dir
	docker-compose -f srcs/docker-compose.yml --env-file=srcs/.env up -d --build
clean:
	docker-compose -f srcs/docker-compose.yml --env-file=srcs/.env down --remove-orphans -v
fclean: clean
	cd ${HOME}/data && sudo rm -rf *
	docker system prune -af
	docker container prune -f
	docker image prune -af
dir:
	sudo mkdir -p ${DATA_DIR}/wp
	sudo mkdir -p ${DATA_DIR}/db
