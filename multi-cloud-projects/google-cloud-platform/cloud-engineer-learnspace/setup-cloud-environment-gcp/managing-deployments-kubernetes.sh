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
kubectl rollout undo deployment/hello

# Verify the rollback in the history
kubectl rollout history deployment/hello

# Finally, verify that all the Pods have rolled back to their previous versions:
kubectl get pods -o jsonpath --template='{range .items[*]}{.metadata.name}{"\t"}{"\t"}{.spec.containers[0].image}{"\n"}{end}'

# ------------------------------- #
#
# Task 4 -- Canary deployments
#
# ------------------------------- #

: '
A canary deployment consists of a separate deployment with your new version and a service that targets both your 
normal, stable deployment as well as your canary deployment.

'

# Screenshot image of Canary deployment diagram ----> https://prnt.sc/zW84HTceNqz9

# First, create a new canary deployment for the new version of the app
cat deployments/hello-canary.yaml

# What the output looks like
apiVersion: apps/v1
kind: Deployment
metadata:
  name: hello-canary
spec:
  replicas: 1
  selector:
    matchLabels:
      app: hello
  template:
    metadata:
      labels:
        app: hello
        track: canary
        # Use ver 2.0.0 so it matches version on service selector
        version: 2.0.0
    spec:
      containers:
        - name: hello
          image: kelseyhightower/hello:2.0.0
          ports:
            - name: http
              containerPort: 80
            - name: health
              containerPort: 81
...

# Now create the canary deployment
kubectl create -f deployments/hello-canary.yaml

# After the canary deployment is created, you should have two deployments, hello and hello-canary. 
# Verify it with this kubectl command
kubectl get deployments

: '
On the hello service, the selector uses the app:hello selector which will match pods in both the prod deployment 
and canary deployment. However, because the canary deployment has a fewer number of pods, it will be visible to 
fewer users.

'

# -------------------- #
#
# Verify canary deployment
#
# -------------------- #

# You can verify the hello version being served by the request:
curl -ks https://`kubectl get svc frontend -o=jsonpath="{.status.loadBalancer.ingress[0].ip}"`/version

# Run this several times and you should see that some of the requests are served by hello 1.0.0 and a small subset (1/4 = 25%) are served by 2.0.0.

# Canary deployments in production - session affinity

: '
In this lab, each request sent to the Nginx service had a chance to be served by the canary deployment. 
But what if you wanted to ensure that a user didn't get served by the Canary deployment? A use case could be 
that the UI for an application changed, and you don't want to confuse the user. In a case like this, you want 
the user to "stick" to one deployment or the other.

You can do this by creating a service with session affinity. This way the same user will always be served from the 
same version. In the example below the service is the same as before, but a new sessionAffinity field has been 
added, and set to ClientIP. All clients with the same IP address will have their requests sent to the same version 
of the hello application.


'

kind: Service
apiVersion: v1
metadata:
  name: "hello"
spec:
  sessionAffinity: ClientIP
  selector:
    app: "hello"
  ports:
    - protocol: "TCP"
      port: 80
      targetPort: 80

# ------------------------------ #
#
# Task 5 -- Blue-green deployments
#
# ------------------------------ #

: '
Rolling updates are ideal because they allow you to deploy an application slowly with minimal overhead, minimal 
performance impact, and minimal downtime. There are instances where it is beneficial to modify the load balancers 
to point to that new version only after it has been fully deployed. In this case, blue-green deployments are the 
way to go.

'

: '
Kubernetes achieves this by creating two separate deployments; one for the old blue version and one for the 
new green version. Use your existing hello deployment for the "blue" version. The deployments will be accessed 
via a Service which will act as the router. Once the new green version is up and running, youll switch over to 
using that version by updating the Service.
'

# screenshot image diagram of blue-green deployments
# --> https://prnt.sc/-UJhS1Fggo1u

: '
Note: A major downside of blue-green deployments is that you will need to have at least 2x the resources in your 
cluster necessary to host your application. Make sure you have enough resources in your cluster before deploying 
both versions of the application at once.

'

# The service
: '
Use the existing hello service, but update it so that it has a selector app:hello, version: 1.0.0. The selector 
will match the existing "blue" deployment. But it will not match the "green" deployment because it will use a 
different version.

'

# First update the service
kubectl apply -f services/hello-blue.yaml

# Note! --> Note: Ignore the warning that says resource service/hello is missing as this is patched automatically.

# Updating with Blue-Green deployments
: '
In order to support a blue-green deployment style, we will create a new "green" deployment for our new version. 
The green deployment updates the version label and the image path.

'

apiVersion: apps/v1
kind: Deployment
metadata:
  name: hello-green
spec:
  replicas: 3
  selector:
    matchLabels:
      app: hello
  template:
    metadata:
      labels:
        app: hello
        track: stable
        version: 2.0.0
    spec:
      containers:
        - name: hello
          image: kelseyhightower/hello:2.0.0
          ports:
            - name: http
              containerPort: 80
            - name: health
              containerPort: 81
          resources:
            limits:
              cpu: 0.2
              memory: 10Mi
          livenessProbe:
            httpGet:
              path: /healthz
              port: 81
              scheme: HTTP
            initialDelaySeconds: 5
            periodSeconds: 15
            timeoutSeconds: 5
          readinessProbe:
            httpGet:
              path: /readiness
              port: 81
              scheme: HTTP
            initialDelaySeconds: 5
            timeoutSeconds: 1

# create the green deployment
