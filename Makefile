up:
	docker-compose -f ./src/docker-compose.yml up --build -d

down:
	docker-compose --env-file ./src/my_env_file.env -f ./src/docker-compose.yml down --volumes

restart:
	docker-compose --env-file ./src/my_env_file.env -f ./src/docker-compose.yml restart