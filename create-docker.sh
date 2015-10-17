#!/bin/bash

CONTAINER="${1}";

if [ "$CONTAINER" == "" ]; then
echo "please enter container new-name";
echo "ex: sh create_docker.sh laravel5";
exit;
fi

# create docker-container
docker run -idt \
--name "$CONTAINER" \
-p 8080:80 \
-p 8081:81 \
-p 3306:3306 \
imagine10255/centos6-lnmp:v2.0.2

# enter docker-container
sh ./enter_docker.sh $CONTAINER
