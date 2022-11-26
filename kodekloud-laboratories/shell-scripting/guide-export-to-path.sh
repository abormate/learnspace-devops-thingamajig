# If you place linux commands in series and sequence inside a shell file (*.sh file). The commands will run in order one after another. 
# example for "create-and-launch-rocket.sh" -- sh file doesn't run right away when you type the name of the file, without the "sh" file extension -- much like any generic command in Linux 
# shell script below typed as a command below doesn't run -- will throw an error
create-and-launch-rocket

# look for the directories defined in the system PATH
# to do so, run the following command 
echo $PATH

# echo command above, outputs the PATH directories 
# which could look like this as an output --> /usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin 
# --> this is the paths defined for variable "$PATH" for this Linux instance

# export the new shell script's path/directory to $PATH
export PATH=$PATH:/home/username-linux

# when you run the shell script again as a command, it now then works fine
create-and-launch-rocket

# to find the path/directory of the shell script, if it's already defined in the $PATH
which create-and-launch-rocket

# above which command --> outputs --> /home/username-linux/create-and-launch-rocket 

# final reminders -- if shell script doesn't run, check the permissions if it's executable -- if not modify it's permissions with "chmod" 
# additionally, if you do plan to make a shell script executable, then when you name the file, leave out the "*.sh" file extension.
# and if you do not plan to make it an executable, then include the "*.sh" file extension
