FROM tutum/lamp:latest

RUN rm -rf /app
ADD . /app
ADD docker_files/apache_default /etc/apache2/sites-available/000-default.conf

RUN chmod 755 /app/docker_files/*.sh

EXPOSE 80
#  3306
CMD ["/app/docker_files/run.sh"]
