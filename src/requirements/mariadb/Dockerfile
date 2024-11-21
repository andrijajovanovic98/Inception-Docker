FROM debian:bullseye

RUN apt-get update && apt-get install -y \
    mariadb-server \
    mariadb-client \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

RUN mkdir -p /run/mysqld && chown -R mysql:mysql /run/mysqld

COPY ./conf/my.cnf /etc/mysql/mariadb.conf.d/
COPY ./tools/create_sql.sh /docker-entrypoint-initdb.d/
RUN chmod +x /docker-entrypoint-initdb.d/create_sql.sh

EXPOSE 3306

ENTRYPOINT ["bash", "/docker-entrypoint-initdb.d/create_sql.sh"]
