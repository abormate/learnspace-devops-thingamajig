# Rocket (customized Linux commands) -- launch sequence and checklist
 
:' step 1
Rocket commands have been configured on your system. Let's test it out. Run the rocket-ls command to list all rockets.
'

rocket-ls

:' step 2
Let's create a new directory for our new mission. Every mission requires a new directory created by the mission name. Create a new directory at /home/bob named lunar-mission.
Note that all future rocket commands must be run from the parent directory of this mission directory. That is /home/bob in your case
'

mkdir lunar-mission

:' step 3
Now let's create a rocket. Make sure your current working directory is at /home/bob and run the rocket-add lunar-mission command.
'

rocket-add lunar-mission

:' step 4
Next step is to start auxiliary power. Run the rocket-start-power lunar-mission command
'

rocket-start-power lunar-mission

:' step 5
Great job! Next step is to switch to internal power. Run the rocket-internal-power lunar-mission command
'

rocket-internal-power lunar-mission

:' step 6
Awesome! Next step is to initiate auto sequence. Run the rocket-start-sequence lunar-mission command.
'

rocket-start-sequence lunar-mission

:' step 7
Perfect! Just 2 more steps. Next, start the main engine. Run the rocket-start-engine lunar-mission command.
'

rocket-start-engine lunar-mission

:' step 8
Finally! Let's now initiate Lift off!!! Run the rocket-lift-off lunar-mission command.
Once done, wait for the status to be success. Give it a few seconds.
'

rocket-lift-off lunar-mission

:' step 9
Let's check the status of the launch. Run the rocket-status lunar-mission command to check the status of the launch.
What's the status of your launch?
'

rocket-status lunar-mission

:' step 10
Great job! You have successfully completed your first mission. Want to go again? Why not launch another rocket - this time to mars? Follow the same steps as before to launch a mars-mission. Below are the commands for your convenience.

First create a directory mars-mission.

Then run the below commands. Remember to provide the mission name on each command.

rocket-add

rocket-start-power

rocket-internal-power

rocket-start-sequence

rocket-start-engine

rocket-lift-off

rocket-status
'




