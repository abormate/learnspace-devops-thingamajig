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
Make a commit with your changes on the dev branch and push changes to trigger the 
sample-app-dev-deploy build job.
'

# step 04 --
:'
Verify your build executed successfully, and verify the development-deployment application 
was deployed onto the dev namespace of the cluster.
'