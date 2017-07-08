#!/bin/bash
# launch a container of the flaskdoc image
docker run -d -p 5000:5000 --name flaskdoc flaskdoc
