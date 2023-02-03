#
# Download source code -- Task 1
#
gcloud config set compute/zone

# Copy the laboratory's sample code
gsutil cp gs://spls/gsp051/continuous-deployment-on-kubernetes.zip .

unzip continuous-deployment-on-kubernetes.zip

#
# cd to correct directory
#
cd continuous-deployment-on-kubernetes

#
# Task 2
# Provision Jenkins
#
gcloud container clusters create jenkins-cd \
--num-nodes 2 \
--machine-type n1-standard-2 \
--scopes "https://www.googleapis.com/auth/source.read_write,cloud-platform"

# verify cluster is running
gcloud container cluster list

# get credentials for your cluster
gcloud container clusters get-credentials jenkins-cd
