#!/bin/bash

CONTAINERID="${1}";

if [ "$CONTAINERID" == "" ]; then
echo "please enter container id";
echo "ex: sh enter_docker.sh laravel5";
exit;
fi

docker exec -it $CONTAINERID bash
