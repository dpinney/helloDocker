#!/bin/bash
# stop and rm the staticsite container
NAME="cli_docker"
docker stop $NAME
docker rm $NAME
docker rmi $NAME
