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

