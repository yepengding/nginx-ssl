#!/bin/bash
domain=example.org

echo "### Generating initial Ngninx config..."
echo "server {
    listen 80;
    listen [::]:80;

    server_name $domain www.$domain;
    server_tokens off;

    location /.well-known/acme-challenge/ {
        root /var/www/certbot;
    }

    location / {
        return 301 https://$domain\$request_uri;
    }
}" > nginx/conf/app.conf

echo "### Composing Nginx and Cerbot services..."
docker compose up -d

echo "### Simulating a certificate request..."
docker compose run --rm  certbot certonly --webroot --webroot-path /var/www/certbot/ --dry-run -d $domain

echo "### Generating SSL Nginx config..."
echo "server {
    listen 443 default_server ssl http2;
    listen [::]:443 ssl http2;

    server_name $domain;

    ssl_certificate /etc/nginx/ssl/live/$domain/fullchain.pem;
    ssl_certificate_key /etc/nginx/ssl/live/$domain/privkey.pem;
    
    location / {
        root   /usr/share/nginx/html;
        index  index.html index.htm;
    }
}" >> nginx/conf/app.conf

echo "### Creating certificates..."
docker compose run --rm  certbot certonly --webroot --webroot-path /var/www/certbot/ -d $domain

echo "### Restarting services..."
docker compose restart

echo "### Set up successfully!"