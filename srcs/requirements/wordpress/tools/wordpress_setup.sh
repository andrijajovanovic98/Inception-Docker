#!/bin/bash

sed -i "s/db_name/$DB_NAME/g" /var/www/wp-config.php
sed -i "s/db_user/$DB_USER/g" /var/www/wp-config.php
sed -i "s/db_password/$DB_PASSWORD/g" /var/www/wp-config.php
sed -i "s/db_host/$DB_HOST/g" /var/www/wp-config.php

if [ ! -d /run/php ]; then
    mkdir -p /run/php
    chown -R www-data:www-data /run/php
    chmod 755 /run/php
fi


if [ ! -f /var/www/html/wp-config.php ]; then
    echo "WordPress installing in process.."
    wget https://wordpress.org/latest.tar.gz -O /tmp/wordpress.tar.gz
    tar -xvzf /tmp/wordpress.tar.gz -C /tmp/
    cp -r /tmp/wordpress/* /var/www/html/
    rm -rf /tmp/wordpress /tmp/wordpress.tar.gz
fi

apt-get update
apt-get install -y curl

echo "wp-cli installing..."
curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
chmod +x wp-cli.phar
mv wp-cli.phar /usr/local/bin/wp

echo "WordPress installing with wp-cli..."
wp core install --url=${DOMAIN_NAME} --title=${WP_TITLE} --admin_user=${WP_ADMIN_USER} --admin_password=${WP_ADMIN_PASSWORD} --admin_email=${WP_ADMIN_EMAIL} --path=/var/www/html --allow-root
wp user create ${USER2} ${USER2_EMAIL} --role=subscriber --user_pass=${USER2_PASSWORD} --path=/var/www/html --allow-root

echo "WordPress is successfully installed"
exec "$@"

