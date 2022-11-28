#print uptime through variable in Ubuntu at least --> note that variables cannot use dashes, only underscores and is only alphanumeric
up_time=$(uptime)

echo "The uptime of the system is $up_time"

