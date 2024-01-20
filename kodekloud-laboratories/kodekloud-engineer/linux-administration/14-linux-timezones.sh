# ----------------------------------------------- #
#
# -- Kode Kloud Engineer -- Linux -- Timezones --
#
# ----------------------------------------------- #

: '
During the daily standup, it was pointed out that the timezone across 
Nautilus Application Servers in Stratos Datacenter doesn't match with 
that of the local datacenter's timezone, which is America/Argentina/Rio_Gallegos.

Correct the mismatch.

'

ssh tony@stapp01

ssh steve@stapp02

ssh banner@stapp03

sudo su -

timedatectl list-timezones

timedatectl set-timezone America/Argentina/Rio_Gallegos

timedatectl status
