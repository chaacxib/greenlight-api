include .env
export ${shell sed 's/=.*//' .env}

APP_PATH = ./cmd/api

start-db:
	docker-compose up -d

stop-db:
	docker-compose down

run-app:
	go run ${APP_PATH}