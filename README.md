# Search Engine

[![pipeline status](https://gitlab.com/sigorilla/search-engine/badges/master/pipeline.svg)](https://gitlab.com/sigorilla/search-engine/commits/master)
[![coverage report](https://gitlab.com/sigorilla/search-engine/badges/master/coverage.svg)](https://gitlab.com/sigorilla/search-engine/commits/master)

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
