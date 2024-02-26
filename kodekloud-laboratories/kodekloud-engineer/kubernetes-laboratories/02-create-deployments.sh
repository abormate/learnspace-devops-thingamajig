# --------------------------------------- #
#
# -- Create Kubernetes Deployments --
#
# --------------------------------------- #

: '
The Nautilus DevOps team has started practicing some pods and services deployment on 
Kubernetes platform, as they are planning to migrate most of their applications on 
Kubernetes. Recently one of the team members has been assigned a task to create a 
deployment as per details mentioned below:

Create a deployment named nginx to deploy the application nginx using the image 
nginx:latest (remember to mention the tag as well)

Note: The kubectl utility on jump_host has been configured to work with the kubernetes 
cluster.

'

# create manifest 

: '

apiVersion: apps/v1
kind: Deployment
metadata:
     name: nginx
spec:
     selector:
          matchLabels:
               app: myapp
     template:
          metadata:
               labels:
                    app: myapp
          spec:
               containers:
               - name: nginx
                image: nginx:latest

'

cat > deploy.yml

# paste yaml code

cat deploy.yml

# to verify

kubectl apply -f deploy.yml

