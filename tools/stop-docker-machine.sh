#!/bin/bash

export GOOGLE_PROJECT=sigorilla-search-engine

docker-machine rm docker-host

eval $(docker-machine env --unset)
