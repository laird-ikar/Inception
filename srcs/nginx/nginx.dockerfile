FROM alpine:3.16

COPY ./nginx.conf /etc/nginx/nginx.conf

# Install Nginx
RUN apk update && apk add nginx

EXPOSE 443

CMD ["nginx", "-c" , "/etc/nginx/nginx.conf"]