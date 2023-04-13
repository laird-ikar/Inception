FROM debian:buster

RUN	apt-get update && \
	apt-get install -y	\
	curl \
	mariadb-client \
	php7.3 \
	php7.3-fpm \
	php7.3-curl \
	php7.3-mysql \
	php7.3-mbstring \
	php7.3-xml \
	php7.3-zip \
	php7.3-gd \
	php7.3-imap

# Creation of the folders to enable wordpress and php start 
RUN	mkdir -p /var/www/html ; mkdir -p /run/php

# Installation of WP-CLI = WordPress command line interface
RUN	curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && \
	chmod +x wp-cli.phar && \
	mv wp-cli.phar /usr/local/bin/wp

# PHP-FPM configuration is done in the file www.conf
COPY ./www.conf /etc/php/7.3/fpm/pool.d/www.conf

# WordPress installation script is imported in /usr/local/bin to be executed as entrypoint
COPY ./start_wordpress.sh /usr/local/bin/setup_wordpress.sh

# Serves only as documentation here
EXPOSE 9000

ENTRYPOINT [ "sh", "/usr/local/bin/setup_wordpress.sh" ]

# Command launched at the end of the setup
CMD [ "php-fpm7.3", "-F" ]