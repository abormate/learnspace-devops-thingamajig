:'
Let's update our script to take into consideration the time a rocket spends in a launching state.

The script is available at the path /home/bob/create-and-launch-rocket. Add a while loop before the if conditional statements that checks the status of rocket to wait until the rocket is in a launching state
'

mission_name=$1

mkdir $mission_name

rocket-add $mission_name

rocket-start-power $mission_name
rocket-internal-power $mission_name
rocket-start-sequence $mission_name
rocket-start-engine $mission_name
rocket-lift-off $mission_name

rocket_status=$(rocket-status $mission_name)

echo "The status of launch is $rocket_status"

while [ $rocket_status = "launching" ]
do
  sleep 2
  rocket_status=$(rocket-status $mission_name)
done

if [ $rocket_status = "failed" ]
then
  rocket-debug
fi
