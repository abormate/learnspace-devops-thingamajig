# ---------------------------------------------- #
#
# -- Linux -- Resource Limits -- Kode Kloud Engineer --
#
# ---------------------------------------------- #

: '
On our Storage server in Stratos Datacenter we are having some issues where nfsuser 
user is holding hundred of processes, which is degrading the performance of the server. 
Therefore, we have a requirement to limit its maximum processes. 

Please set its maximum process limits as below:

a. soft limit = 1025
b. hard_limit = 2027

'
ssh natasha@ststor01

sudo su -

cat /etc/security/limits.conf | grep nproc | grep -v ^#

vim /etc/security/limits.conf

# Add nfsuser hard and soft nproc limits set to 1025 and 2027 respectively

cat /etc/security/limits.conf | grep nproc | grep -v ^#

