FROM debian:bullseye

RUN apt-get update && apt-get install -y \
    php7.4 \
    php7.4-mysqli \
    php7.4-fpm \
    wget \
    sendmail \
    unzip



COPY ./conf/custom_php_config.conf /etc/php/7.4/fpm/pool.d/www.conf

COPY ./tools /var/www/


RUN chown -R www-data:www-data /var/www && chmod -R 755 /var/www

RUN chmod +x /var/www/wordpress_setup.sh

EXPOSE 9000

ENTRYPOINT ["/var/www/wordpress_setup.sh"]

CMD ["/usr/sbin/php-fpm7.4", "--nodaemonize"]

