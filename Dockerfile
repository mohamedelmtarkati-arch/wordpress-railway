FROM wordpress:6.4-php8.2-apache

RUN a2dismod mpm_event || true \
 && a2dismod mpm_worker || true \
 && a2enmod mpm_prefork

RUN chown -R www-data:www-data /var/www/html
