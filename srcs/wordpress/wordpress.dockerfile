FROM alpine:3.16

# Install tar
RUN apk update && apk add --no-cache tar

# Install php-fpm
RUN apk update && apk add --no-cache php8 php8-fpm php8-opcache php8-gd			\
	php8-mysqli php8-zlib php8-curl php8-mbstring php8-json php8-session

RUN	adduser -S nginx &&	addgroup -S nginx

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
CMD ["php-fpm8", "-F"]