FROM alpine:3.16

# Download and install Wordpress
RUN wget http://wordpress.org/latest.tar.gz
RUN tar latest.tar.gz
RUN rm latest.tar.gz

# Install php-fpm
RUN apk update && apk add --no-cache php7 php7-fpm php7-opcache php7-gd			\
	php7-mysqli php7-zlib php7-curl php7-mbstring php7-json php7-session

# Copy the php-fpm configuration file
COPY ./wp-config.php /wordpress/wp-config.php

# Launch php-fpm
CMD ["php-fpm"]