DOCKER_COMPOSE_FILE = ./srcs/docker-compose.yml

WORDPRESS_DATA_DIR = /home/data/wordpress
MYSQL_DATA_DIR = /home/data/mysql

DOCKER_COMPOSE = docker-compose -f $(DOCKER_COMPOSE_FILE)

all: setup up

down:
	@$(DOCKER_COMPOSE) down

re: clean all

clean: down
	@docker rmi -f $$(docker images -q)

.PHONY: all down re clean

setup:
	@mkdir -p $(WORDPRESS_DATA_DIR)
	@mkdir -p $(MYSQL_DATA_DIR)

up: setup
	@$(DOCKER_COMPOSE) up -d --build
