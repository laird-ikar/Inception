FROM alpine:3.16

#install mariadb
RUN apk update && apk add mariadb mariadb-client

#copy the configuration file
COPY ./mariaddb.conf /etc/mysql/my.cnf

#copy the script that will create the database
COPY ./create_db.sh /tmp/create_db.sh

# Expose the port
EXPOSE 3306

#launch mariadb
CMD [ "mysqld" ]

