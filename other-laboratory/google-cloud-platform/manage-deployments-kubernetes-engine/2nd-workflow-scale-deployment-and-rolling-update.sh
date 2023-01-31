#
# Continuing activity from previous 1st workflow of Kubernetes deployment
# Now that we have a deployment created. Let's try to scale it up and down with Kubernetes
kubectl explain deployment.spec.replicas

# First start with the explanation from Kubernetes
kubectl explain deployment.spec.replicas

# Replicas field can be updated using kubectl scale command
kubectl scale deployment hello --replicas=5

# the code above for kubectl will spin 5 replica nodes

# Verify that there are now 5 "hello" pods running
kubectl get pods | grep hello- | wc -l

# Now try to scale down the application down to 3
kubectl scale deployment hello --replicas=3

# Verify that you now have the scaled down number of pods
kubectl get pods | grep hello- | wc -l
