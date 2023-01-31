:'
Dev Ops practices will regularly make use of multiple deployments to manage application deployment scenarios 
such as "Continuous deployment", "Blue-Green deployments", "Canary deployments" and more. 
This is to provide practice in scaling and managing containers so you can accomplish these common scenarios where multiple heterogeneous 
deployments are being used.
'
#
#
#
#

:'
Heterogeneous deployments typically involve connecting two or more distinct infrastructure environments or regions to address 
a specific technical or operational need. Heterogeneous deployments are called "hybrid", "multi-cloud", or "public-private", 
depending upon the specifics of the deployment.

For the purposes of this lab, heterogeneous deployments include those that span regions within a single cloud environment, 
multiple public cloud environments (multi-cloud), or a combination of on-premises and public cloud environments (hybrid or public-private).
'
#
#
#
# 
#
:'
Various business and technical challenges can arise in deployments that are limited to a single environment or region:

-- Maxed out resources: In any single environment, particularly in on-premises environments, you might not have the compute, networking, and storage resources to meet your production needs.
-- Limited geographic reach: Deployments in a single environment require people who are geographically distant from one another to access one deployment. Their traffic might travel around the world to a central location.
-- Limited availability: Web-scale traffic patterns challenge applications to remain fault-tolerant and resilient.
-- Vendor lock-in: Vendor-level platform and infrastructure abstractions can prevent you from porting applications.
-- Inflexible resources: Your resources might be limited to a particular set of compute, storage, or networking offerings.
-- Heterogeneous deployments can help address these challenges, but they must be architected using programmatic and deterministic processes and procedures. One-off or ad-hoc deployment procedures can cause deployments or processes to be brittle and intolerant of failures. Ad-hoc processes can lose data or drop traffic. Good deployment processes must be repeatable and use proven approaches for managing provisioning, configuration, and maintenance.

Three common scenarios for heterogeneous deployment are multi-cloud deployments, fronting on-premises data, and 
continuous integration/continuous delivery (CI/CD) processes.

The following exercises practice some common use cases for heterogeneous deployments, along with well-architected approaches using 
Kubernetes and other infrastructure resources to accomplish them.
'
#
#
#
#
# Once shell is activated. List active account name with
gcloud auth list

# Authorize

# List project ID with...
gcloud config list project


# Set the Zone
gcloud config set compute/zone

