#!/bin/bash

yum update -y

sudo yum install -y httpd httpd-tools mod_ssl

sudo systemctl enable httpd

sudo systemctl start httpd

sudo yum install php php-common php-pear -y
sudo yum install php-{cgi,curl,mbstring,gd,mysqlnd,gettext,json,xml,fpm,intl,zip} -y

sudo rpm -Uvh https://dev.mysql.com/get/mysql57-community-release-el7-11.noarch.rpm
sudo rpm --import https://repo.mysql.com/RPM-GPG-KEY-mysql-2022

sudo yum install mysql-community-server -y
sudo systemctl enable mysqld
