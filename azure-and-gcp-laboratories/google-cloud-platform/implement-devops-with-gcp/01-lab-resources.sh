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

# Configure Git with Cloud Shell, replace <email> with generated laboratory email address

git config --global user.email <email> 
git config --global user.name <name>

# Create an Artifact Registry Docker repo named "my-repository" in the "us-central1" region to store your container images

# Create a Kubernetes cluster with GKE named "hello-cluster" with the following config

:'

Setting	            Value
Zone	            us-central1-a
Release channel	    Regular
Cluster version	    1.25.5-gke.2000 or newer
Cluster autoscaler	Enabled
Number of nodes	    3
Minimum nodes	    2
Maximum nodes	    6
'

# Create "prod" and "dev" namespaces on your cluster

# ----------------------------------------------- #