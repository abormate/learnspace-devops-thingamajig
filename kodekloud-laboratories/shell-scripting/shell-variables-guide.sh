# variables can only be defined with alphanumeric characters and underscores and no with symbols and dashes. But their assignment value can hold dashes.
# variable definitions are case sensitive. For example, "MISSION_NAME" is not equal to "mission_name"

# example variable in action
mission_name=mars-mission
mkdir $mission_name

rocket-start-power $mission_name
rocket-internal-power $mission_name
rocket-crew-ready $mission_name
rocket-start-sequence $mission_name
