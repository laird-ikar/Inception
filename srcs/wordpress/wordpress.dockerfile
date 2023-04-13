FROM debian:buster

RUN apt-get update
RUN apt-get -y install php7.3 php-mysqli php-fpm wget sendmail

RUN	mkdir -p /var/www/html ; mkdir -p /run/php

RUN	curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && \
	chmod +x wp-cli.phar && \
	mv wp-cli.phar /usr/local/bin/wp

EXPOSE 9000

COPY ./www.conf /etc/php/7.3/fpm/pool.d/www.conf
COPY ./start_wordpress.sh /usr/local/bin/

ENTRYPOINT [ "start_wordpress.sh" ]

CMD ["php-fpm7.3", "-F"]