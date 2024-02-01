# ------------------------------------------- #
#
# -- Linux Kode Kloud -- Firewall Rules --
#
# ------------------------------------------- #

: '
The Nautilus system admins team recently deployed a web UI application 
for their backup utility running on the Nautilus backup server in Stratos 
Datacenter. The application is running on port 5003. They have firewalld 
installed on that server. The requirements that have come up include the 
following:

Open all incoming connection on 5003/tcp port. Zone should be public.

'

ssh clint@backupserver

firewall-cmd --permanent --zone=public --add-port=5003/tcp

firewall-cmd --reload

systemctl restart firewalld

