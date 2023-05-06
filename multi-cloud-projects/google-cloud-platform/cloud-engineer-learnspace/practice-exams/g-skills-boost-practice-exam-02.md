1.)  
The development team for the supply chain project is ready to start building their new cloud app using a small Kubernetes cluster for the pilot. The cluster should only be available to team members and does not need to be highly available. The developers also need the ability to change the cluster architecture as they deploy new capabilities. How would you implement this?

Initial:
Implement a private standard regional cluster in us-central1 with a default pool and container-optimized image type.

Result: Wrong answer


2.)
You need to quickly deploy a containerized web application on Google Cloud. You know the services you want to be exposed. You do not want to manage infrastructure. You only want to pay when requests are being handled and need support for custom packages. What technology meets these needs?

Initial:
Cloud Run

Result: Correct

3.)
What action does the terraform apply command perform?

Initial:
Sets up resources requested in the terraform config file.

Result:
Correct


4.)
Cymbal Superstore asks you to implement Cloud SQL as a database backend to their supply chain application. You want to configure automatic failover in case of a zone outage. You decide to use the gcloud sql instances create command set to accomplish this. Which gcloud command line argument is required to configure the stated failover capability as you create the required instances?

Initial:
--availability-type

Result: Correct


5.) 
Which Virtual Private Cloud network type allows you to fully manage IP ranges and the definition of regional subnets?

Initial:
Custom mode network

Result:
Correct


6.) 
The backend of Cymbal Superstore’s e-commerce system consists of managed instance groups. You need to update the operating system of the instances in an automated way using minimal resources. What do you do?

Initial:
Create a new instance template, then click Update VMs. Set the update type to PROACTIVE. Click Start.

Result: Correct


7.) 
You need to analyze and act on files being added to a Cloud Storage bucket. Your programming team is proficient in Python. The analysis you need to do takes at most 5 minutes. You implement a Cloud Function to accomplish your processing and specify a trigger resource pointing to your bucket. How should you configure the --trigger-event parameter using gcloud?


Initial:
--trigger-event google.storage.object.add

Result: Wrong answer


8.)
You require a Cloud Storage bucket serving users in New York City. There is a need for geo-redundancy. You do not plan on using ACLs. What CLI command do you use?

Initial:
Run a gsutil mb command specifying a dual-region bucket and accepting defaults for the other mb settings.

Result: 
Wrong answer


9.)
Cymbal Superstore’s sales department has a medium-sized MySQL database. This database includes user-defined functions and is used internally by the marketing department at Cymbal Superstore HQ. The sales department asks you to migrate the database to Google Cloud in the most timely and economical way. What should you do?

Initial:
Implement a database instance using Cloud SQL, back up your local data, and restore it to the new instance.


Result:
Wrong answer


10.)
Cymbal Superstore’s marketing department needs to load some slowly changing data into BigQuery. The data arrives hourly in a Cloud Storage bucket. You want to minimize cost and implement this in the fewest steps. What should you do?

Initial:
Create a Cloud Function to push data to BigQuery through a Dataflow pipeline.

Result:
Wrong answer