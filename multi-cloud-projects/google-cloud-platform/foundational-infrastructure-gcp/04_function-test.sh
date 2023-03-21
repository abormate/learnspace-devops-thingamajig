# -------------------------------- #
#
# Function test 
#
# -------------------------------- #

# Test that the function writes a message to the cloud log after detecting an event

# Enter the following to create a message test for the function

DATA=$(printf 'Hello World!'|base64) && gcloud functions call helloWorld --data '{"data":"'$DATA'"}'

# The cloud tool returns the execution ID for the function, which means a message has been written in the log.

# Output
# executionId: 3zmhpf7l6j5b

# View logs to confirm that there are log messages with that execution ID

