#!/bin/bash
# Stop, remove, build and start container.
docker stop flaskdoc
docker rm flaskdoc
docker rmi flaskdoc
docker build . -t flaskdoc
docker run -d -p 5000:5000 --name flaskdoc flaskdoc
