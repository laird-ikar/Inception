FROM alpine:3.16

# Install tar
RUN apk update && apk add --no-cache tar

# Download and install Wordpress
RUN wget http://wordpress.org/latest.tar.gz
RUN tar -xf latest.tar.gz
RUN rm latest.tar.gz

# Install php-fpm
RUN apk update && apk add --no-cache php8 php8-fpm php8-opcache php8-gd			\
	php8-mysqli php8-zlib php8-curl php8-mbstring php8-json php8-session

# Copy the php-fpm configuration file
COPY ./wp-config.php /wordpress/wp-config.php

# Start Wordpress
CMD ["php-fpm8", "-F"]