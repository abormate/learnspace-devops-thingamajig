# tested on an Ubuntu distribution of Linux
# the dollar $1 assigned to the variable definition allows the script to accept arguments typed after invoking the shell script to run 

mission_name=$1
  
mkdir $mission_name

rocket-add $mission_name

rocket-start-power $mission_name
rocket-internal-power $mission_name
rocket-start-sequence $mission_name
rocket-start-engine $mission_name
rocket-lift-off $mission_name

rocket-status $mission_name
