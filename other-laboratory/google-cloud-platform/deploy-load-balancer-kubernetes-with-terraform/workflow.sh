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

# 
