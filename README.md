# Search Engine

## Start up

```sh
./tools/start-docker-machine.sh
```

## Start services via `docker-compose`

```sh
cd docker
docker-compose up -d
```

> Don't forget to add ports from `docker/.env` file to firewall in GCP.

## Tear down project

```sh
./tools/stop-docker-machine.sh
```
