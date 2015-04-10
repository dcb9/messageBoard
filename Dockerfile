FROM tutum/lamp:latest

ENV DEBIAN_FRONTEND noninteractive

# install some package 
RUN apt-get install -y python-software-properties python3-software-properties software-properties-common
RUN add-apt-repository ppa:ondrej/php5-oldstable
RUN apt-get update -y 
RUN apt-cache policy php5 php5-curl php5-gd php5-xsl php5-intl
RUN apt-get install -y mysql-client php5-xsl php5-intl php5-curl php5-gd curl
RUN echo 'extension=mcrypt.so'>/etc/php5/cli/conf.d/20-mcrypt.ini && cp -a /etc/php5/cli/conf.d/20-mcrypt.ini /etc/php5/apache2/conf.d/

# install composer
ENV COMPOSER_HOME /root/.composer
ENV PATH /root/.composer/vendor/bin:$PATH
ADD ./docker_files/config.json /root/.composer/config.json

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer --version=1.0.0-alpha9 && \
    /usr/local/bin/composer global require "fxp/composer-asset-plugin:1.0.0-beta4"

RUN rm -rf /app
ADD . /app
RUN chown -R www-data:www-data /app

WORKDIR  /app
RUN sed -i '4s/true/false/g' /app/web/index.php ; sed -i '5s/dev/prod/g' /app/web/index.php
RUN /usr/local/bin/composer install --prefer-dist --no-dev --no-progress --optimize-autoloader
ADD docker_files/apache_default /etc/apache2/sites-available/000-default.conf
RUN chmod 755 /app/docker_files/*.sh
RUN chmod -R 777 /app/web/assets /app/runtime

EXPOSE 80
#  3306
CMD ["/app/docker_files/run.sh"]
