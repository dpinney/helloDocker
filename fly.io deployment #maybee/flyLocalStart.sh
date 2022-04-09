#!/bin/sh
#flyLocalBuild.sh

docker stop fly_test
docker rm fly_test
docker rmi fly_test
docker build . -t fly_test
docker run -d -p 5000:5000 -v "`pwd`/data":/usr/src/app/data --name fly_test fly_test
