# nginx-ssl

Automatically set up SSL in Nginx with Docker.

# Setup

1. Install [docker compose](https://docs.docker.com/compose/install/#install-compose)
2. Clone the repository

```shell
https://github.com/yepengding/nginx-ssl.git
```

3. Modify `setup.sh`

- Replace `domain` with your domain name

4. Assign permissions to `setup.sh`

```shell
chmod +x setup.sh
```

5. (Optional) Copy your homepage files into folder `nginx/hp`


6. Run `setup.sh`

```shell
./setup.sh
```

# Customize Nginx Configuration

1. Edit `nginx/conf/app.conf`

2. Reload Nginx configuration

```shell
docker compose exec nginx nginx -s reload
```

# Renew Certificate

Run command

```shell
docker compose run --rm certbot renew
```