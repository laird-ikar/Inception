FROM debian:buster

# Install php-fpm

RUN apt-get -y update && \
	apt-get -y upgrade && \
	apt-get install -y \
	php7 \
	php7-mysql \
	php7-fpm \
	php7-gd \
	php7-mbstring \
	php7-zip \
	mariadb-client \
	wget

RUN	adduser --system nginx &&	addgroup --system nginx

WORKDIR /var/www/html

# Download and install Wordpress
RUN wget http://wordpress.org/latest.tar.gz
RUN tar -xf latest.tar.gz
RUN rm latest.tar.gz

# Copy the php-fpm configuration file
COPY ./wp-config.php /var/www/html/wp-config.php

# Copy the index to /var/www/html
COPY ./index.php /var/www/html/index.php

EXPOSE 9000

# Start Wordpress
CMD ["php-fpm7", "-F"]