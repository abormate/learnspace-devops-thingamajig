FROM ubuntu

RUN apt-get update && apt-get install -y apache2 

RUN sed -i 's/Listen 80/Listen 3000/g' /etc/apache2/ports.conf

EXPOSE 3000

CMD ["apache2ctl", "-D", "FOREGROUND"]