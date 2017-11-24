#!/bin/bash

docker stack deploy --compose-file=<(docker-compose -f docker-compose.yml -f docker-compose.infra.yml config 2>/dev/null) DEV
