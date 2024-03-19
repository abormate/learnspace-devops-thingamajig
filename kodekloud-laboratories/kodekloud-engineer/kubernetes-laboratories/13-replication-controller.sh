# ---------------------------------------------------- #
#
# -- Replication -- Kubernetes -- Kode Kloud Engineer --
#
# ---------------------------------------------------- #

: '
The Nautilus DevOps team wants to create a ReplicationController to 
deploy several pods. They are going to deploy applications on these 
pods, these applications need highly available infrastructure. 

Below you can find exact details, create the ReplicationController 
accordingly.

-- Create a ReplicationController using nginx image, preferably 
with latest tag, and name it as nginx-replicationcontroller.

-- Labels app should be nginx_app, and labels type should be 
front-end. The container should be named as nginx-container and 
also make sure replica counts are 3.

All pods should be running state after deployment.

'

# go through Kubernetes documentation -- and look for replication controller template -- that creates nginx resources

: '
apiVersion: v1
kind: ReplicationController
metadata:
  name: nginx
spec:
  replicas: 3
  selector:
    app: nginx
  template:
    metadata:
      name: nginx
      labels:
        app: nginx
    spec:
      containers:
      - name: nginx
        image: nginx
        ports:
        - containerPort: 80

'
