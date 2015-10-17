#!/bin/bash

DIRECTORY="/usr/local/mariadb/var/"

# Check & Copy DB Files
if [ "`ls -A $DIRECTORY`" = "" ]; then
  echo "$DIRECTORY not database files, run copy default database files to here"
  mv /opt/backup/mysql-data/* $DIRECTORY
fi


# 檢查服務未啟動時執行
for SERVICE in mariadb nginx php-fpm redis
do
  if ps ax | grep -v grep | grep $SERVICE > /dev/null
  then
     echo "service $SERVICE runing";
  else
     service $SERVICE start;
  fi
done

# 清空初始執行設定資料
cat /dev/null > /opt/bash/init.sh