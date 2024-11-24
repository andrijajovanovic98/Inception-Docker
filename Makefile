up:
	mkdir -p /home/ajovanov/data/mariadb /home/ajovanov/data/wordpress
	docker-compose -f ./srcs/docker-compose.yml up --build -d

down:
	docker-compose --env-file ./srcs/.env -f ./srcs/docker-compose.yml down --volumes

clean:
	
	sudo chown -R ajovanov:ajovanov /home/ajovanov/data/wordpress /home/ajovanov/data/mariadb
	sudo chmod -R u+w /home/ajovanov/data/wordpress /home/ajovanov/data/mariadb
	sudo rm -rf /home/ajovanov/data/wordpress /home/ajovanov/data/mariadb

restart:
	docker-compose --env-file ./srcs/.env -f ./srcs/docker-compose.yml restart
