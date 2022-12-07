# 1st lab task
:' Instructions
Another script by the name print-uptime.sh is placed in your home directory at /home/bob.
It must print the uptime of the system as expected. However it's not working'. Please inspect and fix the problem with the script.
'

up_time=$(uptime)

echo "The uptime of the system is $up_time"

# shell script above prints the Linux server uptime

# 2nd lab task
:' Instructions
Another script by the name backup-file.sh is placed in your home directory at /home/bob.
This script creates a backup of a file by creating a copy of the same file and apending _bkp to it's name. However it's not working'. Please inspect and fix the problem with the script.
'

# the following lines -- actual script
# This script creates a backup of a given file by creating a copy as bkp
# For example some-file is backed up as some-file_bkp

file_name="create-and-launch-rocket"

cp $file_name ${file_name}_bkp


# 3rd lab task
:'
Another script by the name create_files.sh is placed in your home directory at /home/bob.

This script creates files by making use of variables. However, there is something wrong with the script, and not all the files have been created. Please fix it.
'

# actual script -- following lines

FILE01="Japan"
FILE02="Egypt"
FILE03="Canada"

cd /home/bob

echo "Creating file called $FILE01"
touch $FILE01

echo "Creating file called $FILE02"
touch $FILE02

echo "Creating file called $FILE03"
touch $FILE03

# file had a non-numerical character
