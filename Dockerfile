FROM php:7-apache
MAINTAINER mauriciomartinello@gmail.com

COPY 000-default.conf /etc/apache2/sites-available/000-default.conf
COPY start-apache /usr/local/bin
RUN a2enmod rewrite
RUN apt-get update && \
    apt-get install nano

# Copy application source
COPY src /var/www/
RUN chown -R www-data:www-data /var/www

CMD ["start-apache"]
