FROM alpine:3.16

#install mariadb
RUN apk update && apk add mariadb mariadb-client

#copy the configuration file
COPY ./mariadb.conf /etc/mysql/my.cnf

# Expose the port
EXPOSE 3306

#launch mariadb
CMD [ "mysqld", "--user=root" ]

