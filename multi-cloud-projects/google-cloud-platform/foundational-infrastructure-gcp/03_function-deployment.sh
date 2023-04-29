# ----------------------------------- #
#
# Cloud Functions -- deployment
#
# ----------------------------------- #

# Learn
: '
What are Cloud events and triggers?

Cloud events are things that happen in your cloud environment.These might be things like changes to data in 
a database, files added to a storage system, or a new virtual machine instance being created.

Events occur whether or not you choose to respond to them. You create a response to an event with a trigger. 
A trigger is a declaration that you are interested in a certain event or set of events. Binding a function 
to a trigger allows you to capture and act on events. For more information on creating triggers and associating 
them with your functions
'

...

: '
When deploying a new function, you must specify --trigger-topic, --trigger-bucket, or --trigger-http. When 
deploying an update to an existing function, the function keeps the existing trigger unless otherwise 
specified
'

# For this time, you'll set the --trigger-topic as hello_world.

# Deploy function to a pub/sub topic named "hello_world". Note, to replace [BUCKET_NAME] 
# with the name of your bucket

gcloud functions deploy helloWorld \
  --stage-bucket [BUCKET_NAME] \
  --trigger-topic hello_world \
  --runtime nodejs8

# NOTE --> If you get an OperationError, ignore the warning and re-run the command

# If prompted, enter "Y" to allow unauthenticated invocations of a new function

# verify status of function

gcloud functions describe helloWorld

# an active status indicates that the function has been deployed

entryPoint: helloWorld
eventTrigger:
  eventType: providers/cloud.pubsub/eventTypes/topic.publish
  failurePolicy: {}
  resource:
...
status: ACTIVE
...

# Every message published in the topic triggers function execution, the message contents are passed as input data

# ------------------------------------- #
#
# END -- Task 3
#
# ------------------------------------- #