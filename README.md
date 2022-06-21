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

5. Run `setup.sh`

```shell
./setup.sh
```
