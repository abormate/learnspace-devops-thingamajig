1.)  
The development team for the supply chain project is ready to start building their new cloud app using a small Kubernetes cluster for the pilot. The cluster should only be available to team members and does not need to be highly available. The developers also need the ability to change the cluster architecture as they deploy new capabilities. How would you implement this?

Initial:
Implement a private standard regional cluster in us-central1 with a default pool and container-optimized image type.


2.)
You need to quickly deploy a containerized web application on Google Cloud. You know the services you want to be exposed. You do not want to manage infrastructure. You only want to pay when requests are being handled and need support for custom packages. What technology meets these needs?

Initial:
Cloud Run

3.)
What action does the terraform apply command perform?

Initial:
Sets up resources requested in the terraform config file.


4.)
Cymbal Superstore asks you to implement Cloud SQL as a database backend to their supply chain application. You want to configure automatic failover in case of a zone outage. You decide to use the gcloud sql instances create command set to accomplish this. Which gcloud command line argument is required to configure the stated failover capability as you create the required instances?

Initial:
--availability-type

5.) 
Which Virtual Private Cloud network type allows you to fully manage IP ranges and the definition of regional subnets?

Initial:
Custom mode network


6.) 
The backend of Cymbal Superstore’s e-commerce system consists of managed instance groups. You need to update the operating system of the instances in an automated way using minimal resources. What do you do?

Initial:
Create a new instance template, then click Update VMs. Set the update type to PROACTIVE. Click Start.


7.) 
You need to analyze and act on files being added to a Cloud Storage bucket. Your programming team is proficient in Python. The analysis you need to do takes at most 5 minutes. You implement a Cloud Function to accomplish your processing and specify a trigger resource pointing to your bucket. How should you configure the --trigger-event parameter using gcloud?


Initial:
--trigger-event google.storage.object.add


8.)
You require a Cloud Storage bucket serving users in New York City. There is a need for geo-redundancy. You do not plan on using ACLs. What CLI command do you use?






