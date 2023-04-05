FROM debian:buster

RUN apt-get update
RUN apt-get install -y mariadb-server

EXPOSE 3306

COPY ./mariadb.cnf /etc/mysql/mariadb.conf.d/mariadb.cnf
COPY ./init_db.sql /var/www/initial_db.sql
COPY ./environnement_cheat.sh /tmp/environnement_cheat.sh

RUN sh /tmp/environnement_cheat.sh

RUN service mysql start && mysql < /var/www/initial_db.sql && rm -f /var/www/initial_db.sql;

CMD ["mysqld"]