include Makefile-variables

all: | docker-build-and-run

############## docker compose
docker-build-and-run: | docker-build docker-run

docker-build:
	docker-compose ${COMPOSE_FILE_OPTION} build

docker-build-no-cache:
	docker-compose ${COMPOSE_FILE_OPTION} build --no-cache

docker-run:
	docker-compose ${COMPOSE_FILE_OPTION} up -d

docker-stop:
	docker-compose ${COMPOSE_FILE_OPTION} stop

docker-restart:
	docker-compose ${COMPOSE_FILE_OPTION} restart

docker-rm:
	docker-compose ${COMPOSE_FILE_OPTION} rm -f

############## composer

composer-install:
	docker-compose ${COMPOSE_FILE_OPTION} exec ${COMPOSE_EXEC_OPTIONS} app sh -c "composer install"

composer-dump-autoload:
	docker-compose ${COMPOSE_FILE_OPTION} exec ${COMPOSE_EXEC_OPTIONS} app sh -c "composer dump-autoload"

composer-update:
	docker-compose ${COMPOSE_FILE_OPTION} exec ${COMPOSE_EXEC_OPTIONS} app sh -c "composer update"

composer-self-update:
	docker-compose ${COMPOSE_FILE_OPTION} exec ${COMPOSE_EXEC_OPTIONS} app sh -c "composer self-update"

composer:
	docker-compose ${COMPOSE_FILE_OPTION} exec ${COMPOSE_EXEC_OPTIONS} app sh -c "composer ${argument}"