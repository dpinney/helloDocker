#!/bin/bash
# stop and rm the staticsite container
NAME="monitorliz"
docker stop $NAME
docker rm $NAME
docker rmi $NAME
