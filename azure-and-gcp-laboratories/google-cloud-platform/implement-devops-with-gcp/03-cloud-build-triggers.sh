# -------------------------------------- #
#
# Create the Cloud Build triggers
#
# -------------------------------------- #

:'
In this section you will create two Cloud Build Triggers. The first trigger listens for changes 
on the master branch and builds a Docker image of your application, pushes it to Google Artifact Registry, 
and deploys the latest version of the image to the prod namespace in your GKE cluster. The second 
trigger will listen for changes on the dev branch and build a Docker image of your application and 
push it to Google Artifact Registry, and deploy the latest version of the image to the dev namespace 
in your GKE cluster.
'

# step 01 -- create Cloud Build trigger named "sample-app-prod-deploy" with the following config:
:'
-- -- Event: "Push to a branch"
-- -- Source repo: "sample-app"

'