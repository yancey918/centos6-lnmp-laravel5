#!/bin/bash

CONTAINER="${1}";

if [ "$CONTAINER" == "" ]; then
echo "please keyin {Container New Name}";
echo "ex: sh create-docker.sh laravel5";
exit;
fi

# create docker-container
docker run -it \
--name "$CONTAINER" \
-p 8080:80 \
-p 8081:81 \
-p 8082:82 \
-p 3306:3306 \
imagine10255/centos6-lnmp-laravel5:latest

# enter docker-container
sh ./enter-docker.sh $CONTAINER