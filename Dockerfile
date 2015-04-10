FROM tutum/lamp:latest

ENV DEBIAN_FRONTEND noninteractive

RUN rm -rf /app
ADD . /app
RUN chown -R www-data:www-data /app

RUN echo "force-unsafe-io" > /etc/dpkg/dpkg.cfg.d/02apt-speedup
RUN echo "Acquire::http {No-Cache=True;};" > /etc/apt/apt.conf.d/no-cache
ENV IMAGE_PRODUCTION_APT_GET_DATE 2015-01-07-22-44
RUN apt-get install -y mysql-client php5-xsl php5-intl php5-curl php5-gd curl && \
  apt-get clean && \
  rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

WORKDIR  /app

ENV COMPOSER_HOME /root/.composer
ENV PATH /root/.composer/vendor/bin:$PATH
ADD ./docker_files/config.json /root/.composer/config.json

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer --version=1.0.0-alpha9 && \
    /usr/local/bin/composer global require "fxp/composer-asset-plugin:1.0.0-beta4"

RUN /usr/local/bin/composer install --prefer-dist --no-dev --no-progress --optimize-autoloader

ADD docker_files/apache_default /etc/apache2/sites-available/000-default.conf

RUN chmod 755 /app/docker_files/*.sh
RUN chmod -R 777 /app/web/assets /app/runtime


RUN echo 'extension=mcrypt.so'>/etc/php5/cli/conf.d/20-mcrypt.ini && cp -a /etc/php5/cli/conf.d/20-mcrypt.ini /etc/php5/apache2/conf.d/
EXPOSE 80
#  3306
CMD ["/app/docker_files/run.sh"]
