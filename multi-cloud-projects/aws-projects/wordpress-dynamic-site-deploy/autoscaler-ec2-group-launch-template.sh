#!/bin/bash

yum update -y

sudo yum install -y httpd httpd-tools mod_ssl

sudo systemctl enable httpd

sudo systemctl start httpd
<<<<<<< HEAD

sudo yum install php php-common php-pear -y
sudo yum install php-{cgi,curl,mbstring,gd,mysqlnd,gettext,json,xml,fpm,intl,zip} -y
=======

sudo amazon-linux-extras enable php7.4
sudo yum clean metadata
>>>>>>> daeaf148fa13cecb9e865848245435f6d4f41330