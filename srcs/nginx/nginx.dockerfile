FROM alpine:3.16

# Install Nginx
RUN apk update && apk add --no-cache nginx

# Nginx ssl configuration
# TODO

# Copy the nginx configuration file
COPY ./nginx.conf /etc/nginx/nginx.conf

# Expose HTTPS
EXPOSE 443

# Launch Nginx
CMD ["nginx", "-c" , "/etc/nginx/nginx.conf"]