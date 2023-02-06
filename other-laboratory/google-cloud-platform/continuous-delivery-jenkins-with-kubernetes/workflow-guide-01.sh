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
#
# What is Jenkins?
:'
Jenkins is an open-source automation server that lets you flexibly orchestrate your build, test, and deployment pipelines. Jenkins 
allows developers to iterate quickly on projects without worrying about overhead issues that can stem from continuous delivery.
'
#
#
# What is Continuous Delivery / Continuous Deployment?
:'
When you need to set up a continuous delivery (CD) pipeline, deploying Jenkins on Kubernetes Engine provides important benefits over a standard 
VM-based deployment.

When your build process uses containers, one virtual host can run jobs on multiple operating systems. Kubernetes Engine provides ephemeral 
build executors—these are only utilized when builds are actively running, which leaves resources for other cluster tasks such as batch processing 
jobs. Another benefit of ephemeral build executors is speed—they launch in a matter of seconds.

Kubernetes Engine also comes pre-equipped with Google's global load balancer, which you can use to automate web traffic routing to your instance(s). 
The load balancer handles SSL termination and utilizes a global IP address that's configured with Google's backbone network—coupled with your web front,
this load balancer will always set your users on the fastest possible path to an application instance.
'

#
#
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
#
:'
You will use a custom values file to automatically configure your Kubernetes Cloud and add the following necessary plugins:

Kubernetes:latest
Workflow-multibranch:latest
Git:latest
Configuration-as-code:latest
Google-oauth-plugin:latest
Google-source-plugin:latest
Google-storage-plugin:latest
'
#
# work with Helm CLI to deploy the chart with your configuration settings

helm install cd jenkins/jenkins -f jenkins/values.yaml --wait

#
#
# After command finishes. Ensure Jenkins pod goes to the running state and container is in ready state.
kubectl get pods

# output of prior command --> NAME                          READY     STATUS    RESTARTS   AGE
#                             cd-jenkins-7c786475dd-vbhg4   2/2       Running   0          1m

#
#
#
# Configure Jenkins service account to be able to deploy to the cluster
#

kubectl create clusterrolebinding jenkins-deploy --clusterrole=cluster-admin --serviceaccount=default:cd-jenkins

# Output of prior command should be
# output --> clusterrolebinding.rbac.authorization.k8s.io/jenkins-deploy created
