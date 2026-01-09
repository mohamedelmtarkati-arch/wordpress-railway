FROM wordpress:6.4-php8.2-fpm

# Install nginx
RUN apt-get update && apt-get install -y nginx \
 && rm -rf /var/lib/apt/lists/*

# Nginx config
RUN rm /etc/nginx/sites-enabled/default
COPY nginx.conf /etc/nginx/conf.d/default.conf

# Permissions
RUN chown -R www-data:www-data /var/www/html

CMD service nginx start && php-fpm
