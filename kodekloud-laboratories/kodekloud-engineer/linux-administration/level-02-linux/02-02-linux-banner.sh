# ------------------------------------------- #
#
# -- Linux Banner -- Kode Kloud -- 
#
# ------------------------------------------- #

: '
During the monthly compliance meeting, it was pointed out that 
several servers in the Stratos DC do not have a valid banner. 

The security team has provided serveral approved templates 
which should be applied to the servers to maintain compliance. 
These will be displayed to the user upon a successful login.

Update the message of the day on all application and db servers for
Nautilus. Make use of the approved template located at 
/home/thor/nautilus_banner on jump host

'

scp /home/thor/nautilus_banner worker@stapp01:/home/worker

vi /etc/ssh/sshd_config 

# modify banner entry with path to copied banner from jumphost

sudo systemctl reload sshd.service

# redo for all the other app servers and one for db server