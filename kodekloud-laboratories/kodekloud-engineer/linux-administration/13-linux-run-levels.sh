# ---------------------------------------------- #
#
# -- Linux -- Run Levels -- Kode Kloud --
#
# ---------------------------------------------- #

: '
New tools have been installed on the app servers in Stratos Datacenter. 
Some of these tools can only be managed from the graphical user interface. 

Therefore, there are some requirements for these app servers as below.

On all App servers in Stratos Datacenter, change the default runlevel so 
that they can boot in GUI (graphical user interface) by default. Please 
do not try to reboot these servers after completing this task.

'

sudo su -

systemctl get-default

systemctl list-units --type=target --all

systemctl set-default graphical.target

# run commands as root on all app servers