#!/bin/bash

set -e

# prepare log output
mkdir -p /app/runtime/logs /app/web/assets
touch /var/log/nginx/access.log \
      /var/log/nginx/error.log \
      /app/runtime/logs/web.log \
      /app/runtime/logs/console.log
# adjust folder permissions for docker volume usage
find /app/runtime -type d -print0 | xargs -0 chmod 777
find /app/runtime -type f -print0 | xargs -0 chmod 666
find /app/web/assets -type d -print0 | xargs -0 chmod 777
find /app/web/assets -type f -print0 | xargs -0 chmod 666

# start PHP and nginx
service php5-fpm start
/usr/sbin/nginx
