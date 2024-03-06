# ----------------------------------------------- #
#
# -- Kode Kloud Engineer -- Kubernetes -- Replicaset
#
# ----------------------------------------------- #

: '
Context necessary --

The Nautilus DevOps team is going to deploy some applications on kubernetes cluster as 
they are planning to migrate some of their existing applications there. Recently one 
of the team members has been assigned a task to write a template as per details 
mentioned below:

>> 1. Create a ReplicaSet using httpd image with latest tag only and remember to mention 
tag i.e httpd:latest and name it as httpd-replicaset.

>> 2. Labels app should be httpd_app, labels type should be front-end.

>> 3. The container should be named as httpd-container; also make sure replicas counts 
are 4.


Note: 

The kubectl utility on jump_host has been configured to work with the kubernetes 
cluster.

'

kubectl create deployment httpd-replicaset --image=httpd:latest --replicates=4 --dry-run=client -o yaml

kubectl create deployment httpd-replicaset --image=httpd:latest --replicates=4 --dry-run=client -o yaml > replicaset.yaml

vi replicaset.yaml

# modify property --> from replicaset template off kubernetes.io

kubectl create -f replicaset.yaml

kubectl get replicaset