# ----------------------------------------- #
#
# -- Linux ServerOps -- Postfix Mail Server --
#
# ----------------------------------------- #

: '
Some users of the monitoring app have reported issues with xFusionCorp 
Industries mail server. They have a mail server in Stork DC where they 
are using postfix mail transfer agent. Postfix service seems to fail. 

Try to identify the root cause and fix it.

'

ssh groot@stmail01 

su -

systemctl status postfix

cat /etc/postfix/main.cf | grep inet_interfaces 
vim /etc/postfix/main.cf

# comment localhost entries with vim

systemctl restart postfix; systemctl status postfix





