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

ssh worker01@stapp02

sudo su - 

ssh worker02@stapp03 

sudo su -

# Add rule to allow incoming connections on port 80
sudo firewall-cmd --zone=public --add-port=80/tcp --permanent

# Check if port 8080 is open
sudo firewall-cmd --zone=public --list-ports

# If port 8080 is open, remove it
sudo firewall-cmd --zone=public --remove-port=8080/tcp --permanent

# List all rules for the public zone to confirm
sudo firewall-cmd --zone=public --list-all

# Ensure that the public zone is the default
sudo firewall-cmd --set-default-zone=public

sudo firewall-cmd --reload

exit

exit

exit

# learn to install neovim