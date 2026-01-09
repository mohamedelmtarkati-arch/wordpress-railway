FROM wordpress:php8.2-apache

# Disable other MPMs and enable prefork
RUN a2dismod mpm_event mpm_worker \
 && a2enmod mpm_prefork

# Install wp-cli
RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar \
 && chmod +x wp-cli.phar \
 && mv wp-cli.phar /usr/local/bin/wp

# Fix permissions
RUN chown -R www-data:www-data /var/www/html
