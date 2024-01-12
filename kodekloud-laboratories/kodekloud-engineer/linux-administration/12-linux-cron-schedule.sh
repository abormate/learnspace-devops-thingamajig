# -------------------------------------------- #
#
# -- Cron Schedule -- Linux --
#
# -------------------------------------------- #

: '
To stick with the security compliances, the Nautilus project team has 
decided to apply some restrictions on crontab access so that only 
allowed users can create/update the cron jobs. Limit crontab access to 
below specified users on App Server 1.

Allow crontab access to ammar user and deny the same to garrett user.

'

vim /etc/cron.deny

# add users to deny -- one per each line from file 

