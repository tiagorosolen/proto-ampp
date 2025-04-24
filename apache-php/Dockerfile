# Apache 2 and libraries

FROM php:apache-bookworm

# Enable SSL
RUN set -eux; \
    apt-get update; \
    apt-get install ssl-cert;
	
RUN a2enmod ssl
RUN a2ensite default-ssl
RUN a2enmod proxy
RUN a2enmod proxy_http
RUN a2enmod headers
RUN a2enmod rewrite 
RUN a2enmod socache_shmcb
RUN docker-php-ext-install mysqli 
RUN docker-php-ext-enable mysqli 
RUN docker-php-ext-install pdo_mysql

EXPOSE 80
EXPOSE 443

ENV APACHE_RUN_USER www-data
ENV APACHE_RUN_GROUP www-data
ENV APACHE_PID_FILE /var/run/apache2pid
ENV APACHE_LOG_DIR /var/run/apache2_logs
ENV APACHE_RUN_DIR /var/run/apache2

CMD ["apache2", "-D", "FOREGROUND"]