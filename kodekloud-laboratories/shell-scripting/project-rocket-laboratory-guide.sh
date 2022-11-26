:'
Rocket commands have been configured on your system. Let's test it out. Run the rocket-ls command to list all rockets.
'

rocket-ls

:'
Let's create a new directory for our new mission. Every mission requires a new directory created by the mission name. Create a new directory at /home/bob named lunar-mission.
Note that all future rocket commands must be run from the parent directory of this mission directory. That is /home/bob in your case
'

mkdir lunar-mission

:'
Now let's create a rocket. Make sure your current working directory is at /home/bob and run the rocket-add lunar-mission command.
'

rocket-add lunar-mission

