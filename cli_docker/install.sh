#!/bin/bash
# Build the image.
NAME="cli_docker"
docker rmi $NAME
THISDIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
docker build $THISDIR -t $NAME