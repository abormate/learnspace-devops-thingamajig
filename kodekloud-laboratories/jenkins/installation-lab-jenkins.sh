#
#
#
root@jenkins-server:~# id mike
uid=1001(mike) gid=1002(mike) groups=1002(mike),27(sudo)
root@jenkins-server:~# 

root@jenkins-server:~# su - mike 
mike@jenkins-server:~$
#
#
#
#

curl -Lv http://localhost:8085/login 2>&1 | grep -i 'x-ssh-endpoint'

Which port does the Jenkins SSH service use?


8888


22


8022


8085

menu
open_in_new
wb_sunny
settings_backup_restore
stop
fullscreen
settings_input_hdmi Jenkins
language Jenkins CLI Docs
Terminal 1

#
#
#

ssh -i /home/mike/.ssh/jenkins_key -l mike -p 8022 jenkins-server help

#
#
#
#

ssh -i /home/mike/.ssh/jenkins_key -l mike -p 8022 jenkins-server  safe-restart
mike@jenkins-server:~$ 

menu
open_in_new
wb_sunny
settings_backup_restore
stop
fullscreen
Terminal 1



