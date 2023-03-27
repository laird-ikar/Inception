FROM alpine:3.16

#Install mariadb
RUN apk update && apk add --no-cache mariadb mariadb-client

