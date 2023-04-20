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
...
containers:
- name: auth
  image: "kelseyhightower/auth:1.0.0"
...

# Save the auth.yaml from vim or vi

# Output should be the following 

apiVersion: apps/v1
kind: Deployment
metadata:
  name: auth
spec:
  replicas: 1
  selector:
    matchLabels:
      app: auth
  template:
    metadata:
      labels:
        app: auth
        track: stable
    spec:
      containers:
        - name: auth
          image: "kelseyhightower/auth:1.0.0"
          ports:
            - name: http
              containerPort: 80
            - name: health
              containerPort: 81
...

: '
Notice how the deployment is creating one replica and its using version 1.0.0 of the auth container.
:' When you run the kubectl create command to create the auth deployment, it will make one pod that conforms to the 
data in the deployment manifest. This means we can scale the number of Pods by changing the number specified in 
the replicas field.

''

# Create your deployment object through kubectl
kubectl create -f deployments/auth.yaml

# After creating a deployment -- verify that it was created
kubectl get deployments

# Once deployment is created, Kubernetes will create a ReplicaSet for the deployment
# We can verify that a ReplicaSet was created for our deployment
kubectl get replicasets

# We should see a ReplicaSet with a name like "auth-xxxxxxx"
# Finally, we can view the Pods that were created as part of our deployment. 
# The single Pod is created by the Kubernetes when the ReplicaSet is created:
kubectl get pods

# Its time to create a service for our auth deployment. You've seen the service manifest files, so we wont go into the details anymore
# Work with kubectl create command to create the auth service
kubectl create -f services/auth.yaml

# Now do the same thing to create and expose the hello deployment
kubectl create -f deployments/hello.yaml
kubectl create -f services/hello.yaml

# And one more time to crete and expose the front-end development space
kubectl create secret generic tls-certs --from-file tls/
kubectl create configmap nginx-frontend-conf --from-file=nginx/frontend.conf
kubectl create -f deployments/frontend.yaml
kubectl create -f services/frontend.yaml

# Interact with frontend through obtaining its externap IP then curling to it
kubectl get services frontend

# This may take a while before the external IP field is populated for your service.
# Just re-rin the above command every once every few seconds until the field is populated.
curl -ks https://<external IP>

# And you get a hello response back
# You can also use the output templating feature of kubectl to use curl as a one-liner
curl -ks https://`kubectl get svc frontend -o=jsonpath="{.status.loadBalancer.ingress[0].ip}"`

# ------------------------------ #
#
# Scale a deployment -- Task 2
#
# ------------------------------ #

# Now that we have a deployment created, we can scale it. Do this by updating the spec.replicas field
kubectl explain deployment.spec.replicas

# The replicas field can be updated using the kubectl scale command
kubectl scale deployment hello --replicas=5

# Note: -- It may take a minute or so for all the new pods to start up

# After the deployment is updated. Kubernetes will automatically update the associated ReplicaSet and start 
# new Pods to make the total number of Pods equal to 5

# Verify that there are now 5 hello Pods running:
kubectl get pods | grep hello- | wc -l

# Scale back the application
kubectl scale deployment hello --replicas=3

# Again, verify the correct number of Pods
kubectl get pods | grep hello- | wc -l

# -------------------------------------- #
#
# Task 3 -- Rolling Update
#
# -------------------------------------- #

: '
Deployments support updating images to a new version through a rolling update mechanism. 
When a deployment is updated with a new version, it creates a new ReplicaSet and slowly increases the 
number of replicas in the new ReplicaSet as it decreases the replicas in the old ReplicaSet
'

# Update deployments with the following
kubectl edit deployment hello

# Change the image in the containers section of the deployment to the following
...
containers:
  image: kelseyhightower/hello:2.0.0
...

# Save and exit
: '
Once you save out of the editor, the updated deployment will be saved to your cluster and Kubernetes will 
begin a rolling update

'

# See the new ReplicaSet that Kubernetes creates
kubectl get replicaset

# You can also see a new entry in the rollout history
kubectl rollout history deployment/hello

# -------------------- #
#
# Pause a rolling update
#
# -------------------- #

# If you detect problems with a running rollout, pause it to stop the update
kubectl rollout pause deployment/hello

# Verify the current state of the rollout
kubectl rollout status deployment/hello

# You can also verify this on the Pods directly
kubectl get pods -o jsonpath --template='{range .items[*]}{.metadata.name}{"\t"}{"\t"}{.spec.containers[0].image}{"\n"}{end}'

# -------------------- #
#
# Resume a rolling update
#
# -------------------- #

# The rollout is paused which means some pods are at the new version and some pods are at the older version
# Resume with the following

kubectl rollout resume deployment/hello

# When a rollout is  complete, you should see the following when running the status command:
kubectl rollout status deployment/hello

# !! NOTE !! -- Output should be the following:
deployment "hello" successfully rolled out

# --------------------- #
#
# Rollback an update
#
# --------------------- #

: '
Assume that a bug was detected in your new version. Since the new version is presumed to have problems, 
any users connected to the new Pods will experience those issues.

'

: '
You will want to roll back to the previous version so you can investigate and then release a version that is fixed 
properly

'

# Use the rollout command to rollback to previous version
