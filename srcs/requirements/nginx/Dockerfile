FROM debian:bullseye

RUN apt update -y && apt upgrade -y && \
    apt install -y nginx openssl

RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
    -keyout /etc/ssl/private/nginx-selfsigned.key \
    -out /etc/ssl/certs/nginx-selfsigned.crt \
    -subj /C=AT//L=Vienna/O=Student/OU=42School/CN=ajovanov.42.fr/emailAddress=support@ajovanov.42.com


COPY ./tools/nginx.sh /
RUN chmod +x /nginx.sh

CMD ["/nginx.sh"]
