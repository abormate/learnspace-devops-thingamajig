# ----------------------------------- #
#
# Cloud Functions -- deployment
#
# ----------------------------------- #

# Learn
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

  