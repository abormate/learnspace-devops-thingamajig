# Introduction to deployments
: '
Heterogeneous deployments typically involve connecting two or more distinct infrastructure environments or 
regions to address a specific technical or operational need. Heterogeneous deployments are called "hybrid", 
"multi-cloud", or "public-private", depending upon the specifics of the deployment.
'

: '
For the purposes of this lab, heterogeneous deployments include those that span regions within a single 
cloud environment, multiple public cloud environments (multi-cloud), or a combination of on-premises and public 
cloud environments (hybrid or public-private).
'

: '
Various business and technical challenges can arise in deployments that are limited to a single environment or region:
'

: '
-- Maxed out resources: In any single environment, particularly in on-premises environments, you might not have the 
compute, networking, and storage resources to meet your production needs.

-- Limited geographic reach: Deployments in a single environment require people who are geographically distant from 
one another to access one deployment. Their traffic might travel around the world to a central location.

-- Limited availability: Web-scale traffic patterns challenge applications to remain fault-tolerant and resilient.

-- Vendor lock-in: Vendor-level platform and infrastructure abstractions can prevent you from porting applications.

-- Inflexible resources: Your resources might be limited to a particular set of compute, storage, or networking 
offerings.
'

: ' 
Heterogeneous deployments can help address these challenges, but they must be architected using programmatic and 
deterministic processes and procedures. One-off or ad-hoc deployment procedures can cause deployments or 
processes to be brittle and intolerant of failures.

Ad-hoc processes can lose data or drop traffic. Good deployment processes must be repeatable and use proven approaches 
for managing provisioning, configuration, and maintenance

'

: '
Three common scenarios for heterogeneous deployment are multi-cloud deployments, fronting on-premises data, and 
continuous integration/continuous delivery (CI/CD) processes.

'

# Activate Cloud Shell
# List active account name with the following command
gcloud auth list 

# Authorize

# List the project ID 
gcloud config list project

# Set the Zone
gcloud config set compute/zone 

# Get sample code for this laboratory
# Sample code for running containers and deployments
gsutil -m cp -r gs://spls/gsp053/orchestrate-with-kubernetes .
cd orchestrate-with-kubernetes/kubernetes

# Create a cluster with 3 nodes
gcloud container clusters create bootcamp \
  --machine-type e2-small \
  --num-nodes 3 \
  --scopes "https://www.googleapis.com/auth/projecthosting,storage-rw"

# ---------------------------------- #
#
# Task 1 -- Learn about the deployment object
#
# ---------------------------------- #

# first, let's take a look at the deployment object
# explain command in kubectl tells us about the deployment object
kubectl explain deployment

# we can also see all the fields with the --recursive option
kubectl explain deployment --recursive

# You can use the explain command as you go through the lab to help you understand the structure of a 
# deployment object and understand what the individual fields do

kubectl explain deployment.metadata.name

# --------------------------------------- #
#
#  Task 2 -- Create a Kubernetes deployment
#
# --------------------------------------- #

# Modify through vim or vi that file at deployments/auth.yaml
vi deployments/auth.yaml

# Modify VM image in the containers section of the deployment file to the following

