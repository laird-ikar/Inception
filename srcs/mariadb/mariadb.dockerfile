FROM debian:buster

RUN apt-get update
RUN apt-get install -y mariadb-server mariadb-client

RUN	mkdir -p /run/mysqld /var/lib/mysql 
RUN chown -R mysql:mysql /run/mysqld /var/lib/mysql

RUN	mysql_install_db --user=mysql --datadir=/var/lib/mysql --auth-root-authentication-method=normal --skip-test-db

EXPOSE 3306

COPY ./mariadb.conf /etc/mysql/my.cnf
COPY ./start_mariadb.sh /usr/local/bin/

ENTRYPOINT [ "sh", "/usr/local/bin/start_mariadb.sh" ]

CMD ["/usr/bin/mysqld_safe", "--datadir=/var/lib/mysql"]