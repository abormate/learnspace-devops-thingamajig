#!/bin/bash

yum update -y

sudo yum install -y httpd httpd-tools mod_ssl

sudo systemctl enable httpd

sudo systemctl start httpd

sudo amazon-linux-extras enable php7.4
sudo yum clean metadata