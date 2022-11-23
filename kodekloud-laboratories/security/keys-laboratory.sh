# holds the public keys server-side for ssh
~/.ssh/authorized_keys

# generated assymmetric keys from shell
ssh-keygen -t rsa 

# secure copy one file from current server to another server
scp <directory path of file> <username@ip addr or hosts path>:<destination directory>

# example of above 
scp /home/linux_user/.ssh/mykey.pub another_linux@app01:/home/another_linux/.ssh/authorized_keys

# ssh into a server if you have the keys
ssh -i <directory path for key file> <user>@<ip addr or hosts name>

# example for above
ssh -i /home/linux-user/.ssh/mykey linux2-user@127.7.8.90

# generate a CSR (certificate signing request) ----------------------------
: '
On app01 create a CSR (certificate signing request) /etc/httpd/csr/app01.csr (key name should be app01.key)
'

# step 1
cd /etc/httpd/csr

# step 2 -- generate CSR
sudo openssl req -new -newkey rsa:2048 -nodes -keyout app01.key -out app01.csr

# step 3 -- verify entries to create CSR
open ssl req -noout -text -in app01.csr

# step 4 -- once we have a CSR - we'll need to send it a CA -- or we can create our own self-signed certificate ------------------
: '
On app01 create a self signed certificate /etc/httpd/certs/app01.crt (key name should app01.key)
'
# go to certs directory
cd /etc/httpd/certs

# step 5
sudo openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout app01.key -out app01.crt

# optional --- test if server is using correct certificate
echo | openssl s_client -showcerts -servername app01.com -connect app01:443 2>/dev/null | openssl x509 -inform pem

# configure apache to use proper certificate
: '
Modify the settings in the file /etc/httpd/conf.d/ssl.conf to point to the self signed cert and key you created. 
Then restart httpd service using the command sudo service httpd restart.
'


