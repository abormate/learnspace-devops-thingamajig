# ------------------------------------ #
#
# Create Cloud Source repositories for end-to-end CI/CD pipeline
#
# ------------------------------------ #

:'
In this task, you will create a repository sample-app in Cloud Source Repositories and will initialize it 
with some sample code. This repository will hold your Go application code, and be the primary source for 
triggering builds.
'

# step 01 -- create empty repository named "sample-app" in Cloud Source

# step 02 -- clone the "sample-app" Cloud Source repo with Cloud Shell

# step 03 -- copy sample code into your sample-app directory, with following command

cd ~
gsutil cp -r gs://spls/gsp330/sample-app/* sample-app

# step 04 -- commit first sample code added to your sample-add directory and push changes to master branch

# 
