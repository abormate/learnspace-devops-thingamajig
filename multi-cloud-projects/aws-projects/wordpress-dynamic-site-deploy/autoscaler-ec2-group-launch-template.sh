#!/bin/bash

yum update -y

sudo yum install -y httpd httpd-tools mod_ssl

sudo systemctl enable httpd

sudo systemctl start httpd

sudo yum install php php-common php-pear -y
sudo yum install php-{cgi,curl,mbstring,gd,mysqlnd,gettext,json,xml,fpm,intl,zip} -y
