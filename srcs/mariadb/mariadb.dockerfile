FROM alpine:3.16

#Install mariadb
RUN apk update && apk add --no-cache mariadb mariadb-client

COPY utils/configure.sh /tmp/mariadb_configure.sh

ENTRYPOINT ["sh", "/utils/mariadb_configure.sh"]

