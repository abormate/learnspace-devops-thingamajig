# -------------------------------- #
#
# Function test 
#
# -------------------------------- #

# Test that the function writes a message to the cloud log after detecting an event

# Enter the following to create a message test for the function

DATA=$(printf 'Hello World!'|base64) && gcloud functions call helloWorld --data '{"data":"'$DATA'"}'

