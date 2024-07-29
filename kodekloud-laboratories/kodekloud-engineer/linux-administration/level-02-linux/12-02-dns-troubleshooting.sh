# ------------------------------------------- #
#
# -- Linux Server -- DNS Troubleshooting --
#
# ------------------------------------------- #

: '
The system admins team of xFusionCorp Industries has noticed 
intermittent issues with DNS resolution in several apps . App Server 1 
in Stratos Datacenter is having some DNS resolution issues, so 
we want to add some additional DNS nameservers on this server.

As a temporary fix we have decided to go with Google public DNS (ipv4). 
Please make appropriate changes on this server.

'

ssh worker00@stapp

sudo su -

cat /etc/resolv.conf

vi /etc/resolv.conf

# enter google's public DNS --> 8.8.8.8 --> then save file

