# How to install Apache HTTPD (Tomcat) on a CentOS Linux distro -- it's already on the default CentOS software repo, so you only need to run the ff:
yum install httpd -y

# After installation, start httpd service
service httpd start

# After starting service, verify status of httpd service
service httpd status

