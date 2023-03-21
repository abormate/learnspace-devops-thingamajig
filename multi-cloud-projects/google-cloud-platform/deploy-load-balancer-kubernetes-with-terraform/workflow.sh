# With Cloud Shell, clone sample code base
gsutil -m cp -r gs://spls/gsp233/* .

# Go to directory --> /tf-gke-k8s-service (load balancer)
cd tf-gke-k8s-service-lb

# Analyze and understand code base main terraform manifest
cat main.tf

# Review K8s terraform file 
cat k8s.tf

# Initialize terraform with declarative manifest
terraform init

# Apply terraform plan made from declarative main manifest and variables
terraform apply

# Sample output from Terraform apply command 
:'
Apply complete! Resources: 7 added, 0 changed, 0 destroyed.
Outputs:
cluster_name = tf-gke-k8s
cluster_region = us-west1
cluster_zone = us-west1-b
load-balancer-ip = 35.233.177.223
network = https://www.googleapis.com/compute/beta/projects/qwiklabs-gcp-5438ad3a5e852e4a/global/networks/tf-gke-k8s
subnetwork_name = tf-gke-k8s
'
