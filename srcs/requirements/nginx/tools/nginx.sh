#!/bin/bash
set -e

cat > /etc/nginx/nginx.conf <<EOF
events {}

http {
    include /etc/nginx/mime.types;
    default_type application/octet-stream;

    server {
        listen 443 ssl;
        server_name $SERVER_NAME;

        ssl_certificate /etc/ssl/certs/nginx-selfsigned.crt;
        $SSLKEY

        ssl_protocols TLSv1.2 TLSv1.3;
        ssl_prefer_server_ciphers on;

        root /var/www/html;
        index index.php;

        location / {
            try_files \$uri \$uri/ /index.php;
        }

        location ~ \\.php\$ {
            include fastcgi_params;
            fastcgi_pass $WORDPRESS_CON;
            fastcgi_index index.php;
            fastcgi_param SCRIPT_FILENAME \$document_root\$fastcgi_script_name;
        }
    }
}
EOF

nginx -g "daemon off;"
