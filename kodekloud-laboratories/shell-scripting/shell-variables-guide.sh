# variables can only be defined with alphanumeric characters and underscores and no with symbols and dashes. But their assignment value can hold dashes.
# variable definitions are case sensitive. For example, "MISSION_NAME" is not equal to "mission_name"

# example variable in action
mission_name=mars-mission
mkdir $mission_name

rocket-start-power $mission_name
rocket-internal-power $mission_name
rocket-crew-ready $mission_name
rocket-start-sequence $mission_name

# you can also store program output values into a variable
rocket_status $mission_name #outputs rocket status for a mission name

# you can do this to assign a program output value into a variable
rocket_status=$(rocket-status $mission_name)

# and then print out the variable with a string to describe it
echo "Status of launch: $rocket_status"
