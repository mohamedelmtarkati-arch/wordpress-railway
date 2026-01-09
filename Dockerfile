FROM wordpress:6.4-php8.2-fpm

RUN apt-get update && apt-get install -y nginx \
 && rm -rf /var/lib/apt/lists/*

RUN rm /etc/nginx/sites-enabled/default
COPY nginx.conf /etc/nginx/conf.d/default.conf

RUN chown -R www-data:www-data /var/www/html

EXPOSE 8080

CMD envsubst '$PORT' < /etc/nginx/conf.d/default.conf > /tmp/default.conf \
 && mv /tmp/default.conf /etc/nginx/conf.d/default.conf \
 && service nginx start \
 && php-fpm
