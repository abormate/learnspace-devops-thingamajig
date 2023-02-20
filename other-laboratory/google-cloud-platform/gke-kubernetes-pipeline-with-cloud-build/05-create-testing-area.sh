# --------------------------------- #
#
# Task 5: Create test environment 
#         and continuous deployment pipeline
#
# --------------------------------- #

#
:'
Cloud Build is also used for the continuous delivery pipeline. The pipeline runs each time a commit is pushed to the candidate branch of 
the hello-cloudbuild-env repository. The pipeline applies the new version of the manifest to the Kubernetes cluster and, if successful, 
copies the manifest over to the production branch. This process has the following properties:
'
:'
-- The candidate branch is a history of the deployment attempts.
-- The production branch is a history of the successful deployments.
-- You have a view of successful and failed deployments in Cloud Build.
-- You can rollback to any previous deployment by re-executing the corresponding build in Cloud Build. A rollback also updates the production 
    branch to truthfully reflect the history of deployments.

Next you will modify the continuous integration pipeline to update the candidate branch of the hello-cloudbuild-env repository, 
triggering the continuous delivery pipeline.
'

#
# Grant Cloud Build access to Kubernetes (GKE)
# To deploy the application in your Kubernetes cluster, Cloud Build needs the Kubernetes Engine Developer Identity and Access Management role.
#

PROJECT_NUMBER="$(gcloud projects describe ${PROJECT_ID} --format='get(projectNumber)')"

gcloud projects add-iam-policy-binding ${PROJECT_NUMBER} \
--member=serviceAccount:${PROJECT_NUMBER}@cloudbuild.gserviceaccount.com \
--role=roles/container.developer

#
# You need to initialize the hello-cloudbuild-env repository with two branches (production and candidate) and a 
# Cloud Build configuration file describing the deployment process.
#
# The first step is to clone the hello-cloudbuild-env repository and create the production branch. It is still empty.
#
#

cd ~

gcloud source repos clone hello-cloudbuild-env

cd ~/hello-cloudbuild-env

git checkout -b production


