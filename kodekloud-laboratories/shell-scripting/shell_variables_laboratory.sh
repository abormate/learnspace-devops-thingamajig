:'
Another script by the name print-uptime.sh is placed in your home directory at /home/bob.
It must print the uptime of the system as expected. However it's not working'. Please inspect and fix the problem with the script.
'

up_time=$(uptime)
  
echo "The uptime of the system is $up_time"
