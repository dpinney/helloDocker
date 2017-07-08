#!/bin/bash
# Stop, remove, build and start container.
docker stop flaskdoc
docker rm flaskdoc
THISDIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
docker build $THISDIR -t flaskdoc
docker run -d -p 5000:5000 --name flaskdoc flaskdoc
