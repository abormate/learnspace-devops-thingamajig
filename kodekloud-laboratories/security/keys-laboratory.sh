# holds the public keys server-side for ssh
~/.ssh/authorized_keys

# generated assymmetric keys from shell
ssh-keygen -t rsa 

# secure copy one file from current server to another server
scp <directory path of file> <username@ip addr or hosts path>:<destination directory>

# example of above 
scp /home/linux_user/.ssh/mykey.pub another_linux@app01:/home/another_linux/.ssh/authorized_keys

