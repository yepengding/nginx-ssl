# nginx-ssl

Automatically set up SSL in Nginx with Docker.

# Quickstart

> This will create a new Nginx instance hosting a website protected by SSL.

1. Install [docker compose](https://docs.docker.com/compose/)
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

# Generate Certificate

1. Assign permissions to `generate.sh`

```shell
chmod +x generate.sh
```

2. Run `generate.sh`

```shell
./generate.sh [domain]
```

# Renew Certificate

## Renew all certificates

1. Assign permissions to `renew.sh`

```shell
chmod +x renew.sh
```

2. Run `renew.sh`

```shell
./renew.sh
```

3. Restart to apply changes to the Nginx instance

```shell
docker compose restart
```

## Renew the certificate for a specific domain

1. Run command

```shell
docker compose run --rm certbot certonly --force-renew -d [domain]
```

2. Restart to apply changes to the Nginx instance

```shell
docker compose restart
```
