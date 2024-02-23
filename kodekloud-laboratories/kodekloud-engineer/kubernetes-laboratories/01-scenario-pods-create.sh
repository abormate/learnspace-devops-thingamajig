# ---------------------------------------------- #
#
# -- Kubernetes -- Create Pods -- LearnSpace --
#
# ---------------------------------------------- #

: '
The Nautilus DevOps team has started practicing some pods and services deployment on 
Kubernetes platform as they are planning to migrate most of their applications on 
Kubernetes platform. Recently one of the team members has been assigned a task to 
create a pod as per details mentioned below:


Create a pod named pod-nginx using nginx image with latest tag only and remember to 
mention the tag i.e nginx:latest.

Labels app should be set to nginx_app, also container should be named as nginx-container.


Note: The kubectl utility on jump_host has been configured to work with the kubernetes 
cluster.

'

kubectl run pod-nginx --image=nginx:latest --dry-run=client -o yaml

kubectl run pod-nginx --image=nginx:latest --dry-run=client -o yaml > pod.yaml

vim pod.yaml

cat pod.yaml

kubectl create -f pod.yaml

kubectl get pods

kubectl describe pod pod-nginx

