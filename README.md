# Search Engine

## Development

```sh
./tools/start-docker-machine.sh
eval $(docker-machine env docker-host)
```

## Start services via `docker-compose`

```sh
cd docker
docker-compose up -d
```

> Don't forget to add ports from `docker/.env` file to firewall in GCP.
