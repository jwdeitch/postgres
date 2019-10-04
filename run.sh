#!/usr/bin/env bash

set -e

docker stop pgsql | true

docker build -t pgsql .

docker run --rm --name pgsql -d -p 1023:22 pgsql

docker exec -it pgsql service ssh start
ssh sshuser:pass@localhost -p 1023
#docker exec -it pgsql bash