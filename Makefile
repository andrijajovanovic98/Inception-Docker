up:
	docker-compose -f ./src/docker-compose.yml up --build -d

down:
	docker-compose --env-file ./src/my_env_file.env -f ./src/docker-compose.yml down --volumes

logs:
	docker-compose --env-file ./src/my_env_file.env -f ./srcdocker-compose.yml logs -f

rebuild:
	docker-compose --env-file ./src/my_env_file.env -f ./src/docker-compose.yml up -d --build

