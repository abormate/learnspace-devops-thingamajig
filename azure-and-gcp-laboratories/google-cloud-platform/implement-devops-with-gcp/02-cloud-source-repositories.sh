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

# step 05 -- create branch named "dev". Make a commit with sample code added to your sample-app 
# directory and push changes to "dev" branch/

# step 06 -- verify that you have the sample code and branches stored in Source repository. 
# --> screenshot for step 06 --->> https://prnt.sc/sIACdkZDZ0CB 

# following context for sample-app
:'
The code you just cloned contains a simple Go application that has two entry points: Red and Blue. 
Each will display a simple colored square on the web page depending on the entry point you go to.
'