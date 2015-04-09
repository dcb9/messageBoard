FROM tutum/lamp:latest

# RUN rm -rf /app
# ADD . /app

EXPOSE 80
#  3306
CMD ["/run.sh"]
