1.
Cymbal Superstore’s supply chain management system has been deployed and is working well. You are tasked with monitoring the system’s resources so you can react quickly to any problems. You want to ensure the CPU usage of each of your Compute Engine instances in us-central1 remains below 60%. You want an incident created if it exceeds this value for 5 minutes. You need to configure the proper alerting policy for this scenario. What should you do?

Initial:
Choose resource type of VM instance and metric of CPU utilization, condition trigger if any time series violates, condition is above, threshold is .60 for 5 minutes.

Result
Incorrect


Secondary:
Choose resource type of VM instance and metric of CPU utilization, condition trigger if any time series violates, condition is above, threshold is .60 for 5 minutes.


2.
Which of the following tasks are part of the process when configuring a managed instance group? (Pick two).

Initial:
-- Choosing instance machine type
-- Providing number of instances

Result
Incorrect

Secondary:
-- Specifying persistent disks
-- Providing number of instances


3.
Cymbal Superstore has a subnetwork called mysubnet with an IP range of 10.1.2.0/24. You need to expand this subnet to include enough IP addresses for at most 2000 users or devices. What should you do?


Initial:
gcloud networks subnets expand-ip-range mysubnet --region us-central1 --prefix-length 21

result
incorrect


4.
You have a scheduled snapshot you are trying to delete, but the operation returns an error. What should you do to resolve this problem?

Initial:
Detach the snapshot schedule before deleting it.

Result
Correct



5.
You have a Cloud Run service with a database backend. You want to limit the number of connections to your database. What should you do?

Initial:
Set Concurrency settings

Result
Incorrect




6. 
You want to view a description of your available snapshots using the command line interface (CLI). What gcloud command should you use?

Initial:
gcloud compute snapshots list


Result
Correct



7.
You want to implement a lifecycle rule that changes your storage type from standard to nearline after a specific date. What conditions should you use? (Pick two).


Initial:
-- Age
-- MatchesStorageClass

Result
Incorrect Age

Secondary:
-- MatchesStorageClass
-- CreatedBefore

8.
Cymbal Superstore’s GKE cluster requires an internal http(s) load balancer. You are creating the configuration files required for this resource. What is the proper setting for this scenario?


Initial:
-- Configure your service object with a type: LoadBalancer.


Result
Incorrect


9.
What is the declarative way to initialize and update Kubernetes objects?

Initial:
kubectl apply

Result
Correct




10.
What Kubernetes object provides access to logic running in your cluster via endpoints that you define?

Initial:
Pods

Result
Incorrect

