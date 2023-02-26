# -------------------------------
#
# Provisioning resources and other dependencies
#
# -------------------------------


:'
In this section, you will initialize your Google Cloud project for the demo environment. 
You will enable the required APIs, configure Git in Cloud Shell, create an Artifact Registry 
Docker repository, and create a GKE cluster to run your production and development applications on.
'

# Enable APIs

gcloud services enable container.googleapis.com \
    cloudbuild.googleapis.com \
    sourcerepo.googleapis.com

# Add Kubernetes Developer role for the Cloud Build service account

export PROJECT_ID=$(gcloud config get-value project)
gcloud projects add-iam-policy-binding $PROJECT_ID \
--member=serviceAccount:$(gcloud projects describe $PROJECT_ID \
--format="value(projectNumber)")@cloudbuild.gserviceaccount.com --role="roles/container.developer"


