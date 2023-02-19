# Description process 
:'
In this lab, you create a CI/CD pipeline that automatically builds a container image from committed code, stores the image in Artifact Registry, 
updates a Kubernetes manifest in a Git repository, and deploys the application to Google Kubernetes Engine using that manifest.
'
#
# You'll create 2 repositories
#
# -- app repository: contains the source code of the application itself
# -- env repository: contains the manifests for the Kubernetes Deployment
#

:'
When you push a change to the app repository, the Cloud Build pipeline runs tests, builds a container image, and pushes it to Artifact Registry. 
After pushing the image, Cloud Build updates the Deployment manifest and pushes it to the env repository. This triggers another Cloud Build pipeline 
that applies the manifest to the GKE cluster and, if successful, stores the manifest in another branch of the env repository.

The app and env repositories are kept separate because they have different lifecycles and uses. The main users of the app repository are 
actual humans and this repository is dedicated to a specific application. The main users of the env repository are automated systems 
(such as Cloud Build), and this repository might be shared by several applications. The env repository can have several branches that each map to 
a specific environment (you only use production in this lab) and reference a specific container image, whereas the app repository does not.

When you finish this lab, you have a system where you can easily:

-- Distinguish between failed and successful deployments by looking at the Cloud Build history.
-- Access the manifest currently used by looking at the production branch of the env repository.
-- Rollback to any previous version by re-executing the corresponding Cloud Build build.

--> --> --> Image diagram of process: https://prnt.sc/X3VCx9-kl9UF
--> --> diagram: https://prnt.sc/4SI0RHwlXJ6g 

#
#
#
#
'
# -------------------------------- #

#
# Pre-check: before task 1
#

# list active account name 

gcloud auth list

#
# list project ID with the following command
#

gcloud config list project

#
# Task 1
# In cloud shell, set your project ID and project number. Save them in the appropriate variables. 
#

export PROJECT_ID=$(gcloud config get-value project)
export PROJECT_NUMBER=$(gcloud projects describe $PROJECT_ID --format='value(projectNumber)')
export REGION=
gcloud config set compute/region $REGION

#
# Next, you need to enable required APIs, initialize git configuration, and download sample code
# The following command, enables APIs for GKE, Cloud Build, Source Repo, and Container analysis.
#

gcloud services enable container.googleapis.com \
    cloudbuild.googleapis.com \
    sourcerepo.googleapis.com \
    containeranalysis.googleapis.com
    
#
# Create an artifact registry docker repo named "my-repository" to store your container images
#

gcloud artifacts repositories create my-repository \
  --repository-format=docker \
  --location=$REGION
  
#
# Create a GKE Kubernetes cluster to deploy the sample application
#

gcloud container clusters create hello-cloudbuild --num-nodes 1 --region $REGION

#
# You'll also need to configure git in Cloud shell. 
# Set your email address and name
#

git config --global user.email "you@example.com"  
git config --global user.name "Your Name"

# ---------------------------------------------- #
#
# TASK 2
# You'll next need to create 2 Git repos "hello-cloudbuild-app" and "hello-cloudbuild-env"
# And, you'll need to initialize "hello-cloudbuild-app" with sample code.
#

gcloud source repos create hello-cloudbuild-app
gcloud source repos create hello-cloudbuild-env

#
# Next you need to clone sample code from GitHub
#
#

cd ~
git clone https://github.com/GoogleCloudPlatform/gke-gitops-tutorial-cloudbuild hello-cloudbuild-app

#
#
# Configure Cloud source repo as a remote
#

cd ~/hello-cloudbuild-app
PROJECT_ID=$(gcloud config get-value project)
git remote add google "https://source.developers.google.com/p/${PROJECT_ID}/r/hello-cloudbuild-app"



