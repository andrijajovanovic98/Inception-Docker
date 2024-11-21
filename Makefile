up:
	mkdir -p /home/ruva/data/mariadb /home/ruva/data/wordpress
	docker-compose -f ./src/docker-compose.yml up --build -d

down:
	docker-compose --env-file ./src/my_env_file.env -f ./src/docker-compose.yml down --volumes

clean:
	
	sudo chown -R ruva:ruva /home/ruva/data/wordpress /home/ruva/data/mariadb
	sudo chmod -R u+w /home/ruva/data/wordpress /home/ruva/data/mariadb
	rm -rf /home/ruva/data/wordpress /home/ruva/data/mariadb

restart:
	docker-compose --env-file ./src/my_env_file.env -f ./src/docker-compose.yml restart
