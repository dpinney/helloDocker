#!/bin/bash
# Stop, remove, build and start container.
NAME="monitorliz"
docker stop $NAME
docker rm $NAME
docker rmi $NAME
THISDIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
docker build $THISDIR -t $NAME
docker run -d -p 5000:5000 --name $NAME $NAME
