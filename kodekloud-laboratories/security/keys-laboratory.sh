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
