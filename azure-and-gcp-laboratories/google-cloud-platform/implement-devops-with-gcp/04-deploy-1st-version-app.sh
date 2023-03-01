# ------------------------------------- #
#
# Deploy 1st versions of the application
#
# ------------------------------------- #

# In this section, you will build the first version of the production application 
# and the development application.

# Build the first dev deployment

# step 01 --
:'
In Cloud Shell, inspect the cloudbuild-dev.yaml file to see the steps in the build process. 
Fill in the <version> on lines 10 and 15 with v1.0.
'

# step 02 --
:'
Navigate to the dev/deployment.yaml file and fill in the <todo> on line 17 with the correct 
container image name.
'

# Info -- Notable
:'
Hint: there are two containers that are built, one for the production app and one for the development app. 
Make sure to reference the correct one!
'

# step 03 --
:'
Commit with your changes on the dev branch and push changes to trigger the 
sample-app-dev-deploy build job.
'

# step 04 --
:'
Verify your build executed successfully, and verify the development-deployment application 
was deployed onto the dev namespace of the cluster.
'

# step 05 --
:'
Put your development-deployment deployment to a LoadBalancer service named dev-deployment-service 
on port 8080, and set the target port of the container to the one specified in the Dockerfile.
'

# step 06 --
:'
Navigate to the Load Balancer IP of the service and add the /blue entry point at the end of the URL 
to verify the application is up and running. It should resemble something like the following: 
http://34.135.97.199:8080/blue
'