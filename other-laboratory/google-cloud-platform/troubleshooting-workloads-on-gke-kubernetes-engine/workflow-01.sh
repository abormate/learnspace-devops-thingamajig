:'
Site Reliability Engineers (SRE) have a broad set of responsibilities, and managing incidents is a critical part of their role. 
You will learn how to take advantage of the integrated capabilities of Google Cloud's operations suite that includes logging, 
monitoring, and rich, out-of-the-box dashboards.

The troubleshooting process is an “iterative” approach where SREs form a hypothesis about the potential root cause of an incident, 
then filter, search, and navigate through large volumes of telemetry data collected from their systems to validate or invalidate their hypothesis. 
If a hypothesis is invalid, SREs will form another hypothesis and perform another iteration until they can isolate a root cause.
'

# activate Cloud shell -- the following shell code lists the active account name
gcloud auth list

# authorize

# list the project ID
gcloud config list project

# -------------------------- #
# SCENARIO (SRE)
#
#
:'
Your organization has deployed a multi-tier microservices application. It is a web-based e-commerce application called "Hipster Shop", 
where users can browse for vintage items, add them to their cart and purchase them. Hipster Shop is composed of many microservices, 
written in different languages, that communicate via gRPC and REST APIs. The architecture of the deployment is optimized for learning purposes 
and includes modern technologies as part of the stack: Kubernetes, Istio, Cloud Operations, App Engine, gRPC, OpenTelemetry, and similar 
cloud-native technologies.

As a member of the Site Reliability Engineering (SRE) team, you are contacted when end users report issues viewing products and adding them to their 
cart. You will explore the various services deployed to determine the root cause of the issue and set up a Service Level Objective (SLO) to 
prevent similar incidents from occurring in the future.
'
#
#
# -------------------------- #

# Step 11
git clone --depth 1 --branch csb_1220 https://github.com/GoogleCloudPlatform/cloud-ops-sandbox.git


