FROM debian:buster

RUN apt-get update
RUN apt-get -y install php7.3 php-mysqli php-fpm wget sendmail

EXPOSE 9000

COPY ./www.conf /etc/php/7.3/fpm/pool.d

CMD ["/usr/sbin/php-fpm7.3", "--nodaemonize"]