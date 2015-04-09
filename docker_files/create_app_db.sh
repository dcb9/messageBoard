#!/bin/bash

mysql_upgrade
/usr/bin/mysqld_safe 2>&1 &

RET=1
while [[ RET -ne 0 ]]; do
    echo "=> Waiting for confirmation of MySQL service startup"
    sleep 2
    mysql -uroot -e "status" > /dev/null 2>&1
    RET=$?
done

mysql -uroot -e "DROP DATABASE IF EXISTS yii2basic"
mysql -uroot -e "CREATE DATABASE IF NOT EXISTS yii2basic DEFAULT cOLLATE utf8_unicode_ci"

mysql -uroot yii2basic < /app/docker_files/init_app_db.sql

mysqladmin -uroot shutdown
