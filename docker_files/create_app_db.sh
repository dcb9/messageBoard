#!/bin/bash

mysql_upgrade >/dev/null 2>&1

/usr/bin/mysqld_safe 2>&1 &

RET=1
while [[ RET -ne 0 ]]; do
    echo "=> Waiting for confirmation of MySQL service startup"
    sleep 2
    mysql -uroot -e "status" > /dev/null 2>&1
    RET=$?
done

mysql -uroot -e "CREATE DATABASE IF NOT EXISTS yii2basic DEFAULT cOLLATE utf8_unicode_ci"
/app/yii migrate --interactive=0

mysqladmin -uroot shutdown
