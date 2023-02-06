#
# What is Kubernetes engine?
:'
Kubernetes Engine is Google Cloud's hosted version of Kubernetes - a powerful cluster manager and orchestration system for containers. 
Kubernetes is an open source project that can run on many different environments—from laptops to high-availability multi-node clusters; 
from virtual machines to bare metal. As mentioned before, Kubernetes apps are built on containers - these are lightweight applications bundled 
with all the necessary dependencies and libraries to run them. This underlying structure makes Kubernetes applications highly available, secure, 
and quick to deploy—an ideal framework for cloud developers.
'

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

Kubernetes Engine uses these credentials to access your newly provisioned cluster—confirm that you can connect to it by running the following command:
kubectl cluster-info

#
# Task 3
# Setup Helm
#
:'
Helm is a package manager that makes it easy to configure and deploy Kubernetes applications. Once you have Jenkins installed, 
you'll be able to set up your CI/CD pipeline.
'

# add Helm stable chart repo
helm repo add jenkins https://charts.jenkins.io

# update Helm
help repo update


#
# Task 4 - Configure and install Jenkins
#
# work with Helm CLI to deploy the chart with your configuration settings

helm install cd jenkins/jenkins -f jenkins/values.yaml --wait

#
