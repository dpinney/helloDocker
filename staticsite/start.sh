#!/bin/bash
# launch a container of the staticsite image
docker run -d -p 80:80 --name staticsite staticsite
