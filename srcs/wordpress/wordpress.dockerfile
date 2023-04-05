FROM debian:buster

RUN apt-get update
# Install PHP and other dependencies
RUN apt-get -y install php7.3 php-mysqli php-fpm wget sendmail

RUN mkdir -p /run/php/

EXPOSE 9000

COPY ./www.conf /etc/php/7.3/fpm/pool.d
COPY ./wp-config.php /var/www/

CMD ["/usr/sbin/php-fpm7.3", "--nodaemonize"]