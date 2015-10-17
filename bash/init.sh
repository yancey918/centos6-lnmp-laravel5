#!/bin/bash

DIRECTORY="/usr/local/mariadb/var/"

# Check & Copy DB Files
if [ "`ls -A $DIRECTORY`" = "" ]; then
  echo "$DIRECTORY not database files, run copy default database files to here"
  cp -r /opt/backup/mysql-data/* $DIRECTORY
fi


# Check & RUN Service
for SERVICE in mariadb nginx php-fpm redis
do
  if ps ax | grep -v grep | grep $SERVICE > /dev/null
  then
     echo "service $SERVICE runing";
  else
     service $SERVICE start;
  fi
done

rm -rf /opt