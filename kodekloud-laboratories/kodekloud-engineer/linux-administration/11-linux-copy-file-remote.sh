# -------------------------------------------- #
#
# -- Linux -- Copy File to Remote Server -- 
#
# -------------------------------------------- #

: '
One of the Nautilus devs has copied confidential data on the jump host in
Stratos DC. That data must be copied to one of the app servers. Because the devs
do not have access to app servers. They asked the system admins to accomplish
the task for them

Copy /tmp/nautilus.txt.gpg from jump server to app server 3
at location /home/code


'

scp /tmp/nautilus.txt.gpg banner@stapp03: /home/code

ssh banner@stapp03

cd /home/code