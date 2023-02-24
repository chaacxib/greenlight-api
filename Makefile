include .env
export ${shell sed 's/=.*//' .env}

APP_PATH = ./cmd/api

start-db:
	docker-compose up -d

stop-db:
	docker-compose down

run-db-migrations:
	migrate -path=./migrations -database=${GREENLIGHT_DB_DSN} up

connect-to-db:
	psql ${GREENLIGHT_DB_DSN}

run-app:
	go run ${APP_PATH}