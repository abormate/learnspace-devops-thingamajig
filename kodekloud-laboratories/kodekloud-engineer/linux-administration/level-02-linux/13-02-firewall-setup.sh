# ------------------------------------ #
#
# -- Linux Firewall Set Up --
#
# ------------------------------------ #

: '
To secure our Nautilus infrastructure in Stratos Datacenter we have 
decided to install and configure firewalld on all app servers. We have 
Apache and Nginx services running on these apps. Nginx is running as a 
reverse proxy server for Apache. 

We might have more robust firewall 
settings in the future, but for now we have decided to go with the 
given requirements listed below:

a. Allow all incoming connections on Nginx port, i.e 80.

b. Block all incoming connections on Apache port, i.e 8080.

c. All rules must be permanent.

d. Zone should be public.

e. If Apache or Nginx services aren't running already, please make sure 
to start them.

'

ssh worker00@stapp01

sudo su -

yum install firewalld -y

systemctl enable nginx; systemctl start nginx; systemctl status

vi /etc/firewalld.conf

