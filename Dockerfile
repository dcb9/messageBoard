FROM schmunk42/yii2-app-basic:latest

WORKDIR /app
COPY . /app
RUN /usr/local/bin/composer install
