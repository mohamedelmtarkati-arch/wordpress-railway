FROM wordpress:6.4-php8.2-apache

# Fix permissions
RUN chown -R www-data:www-data /var/www/html
