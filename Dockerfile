FROM tutum/lamp:latest

ENV DEBIAN_FRONTEND noninteractive

RUN rm -rf /app
ADD . /app
ADD docker_files/apache_default /etc/apache2/sites-available/000-default.conf

RUN chmod 755 /app/docker_files/*.sh
RUN chmod -R 777 /app/web/assets /app/runtime

RUN apt-get install -y mysql-client php5-xsl php5-intl php5-curl php5-gd

RUN echo 'extension=mcrypt.so'>/etc/php5/cli/conf.d/20-mcrypt.ini && cp -a /etc/php5/cli/conf.d/20-mcrypt.ini /etc/php5/apache2/conf.d/
EXPOSE 80
#  3306
CMD ["/app/docker_files/run.sh"]
