:'
In this section, you will initialize your Google Cloud project for the demo environment. 
You will enable the required APIs, configure Git in Cloud Shell, create an Artifact Registry 
Docker repository, and create a GKE cluster to run your production and development applications on.
'

# Enable APIs

gcloud services enable container.googleapis.com \
    cloudbuild.googleapis.com \
    sourcerepo.googleapis.com

