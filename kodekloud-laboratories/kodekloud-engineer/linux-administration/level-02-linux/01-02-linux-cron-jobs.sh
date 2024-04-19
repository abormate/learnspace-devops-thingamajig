# ---------------------------------------- #
#
# -- Linux 02 -- Cron Jobs -- Scheduling -- 
#
# ---------------------------------------- #

: '
The Nautilus system admins team has prepared scripts to automate 
several day-to-day tasks. They want them to be deployed on all app 
servers in Stratos DC on a set schedule. Before that they need to 
test similar functionality with a sample cron job. Therefore, 
perform the steps below:

a. Install cronie package on all Nautilus app servers and start 
crond service.

b. Add a cron */5 * * * * echo hello > /tmp/cron_text for root user.

'

ssh worker@stapp01 

cat /etc/os-release

sudo yum install cronie -y && systemctl start crond.service 
&& systemctl status crond.service

crontab -e

# enter "*/5 * * * * echo hello > /tmp/cron_text" and save then exit

crontab -l

# check if cron job properly entered

watch -n 5 ls -l /tmp 

# check after 5 mins if text file is present inside /tmp/