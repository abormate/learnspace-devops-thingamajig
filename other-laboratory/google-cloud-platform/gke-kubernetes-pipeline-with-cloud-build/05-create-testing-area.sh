# --------------------------------- #
#
# Task 5: Create test environment 
#         and continuous deployment pipeline
#
# --------------------------------- #

#
:'
Cloud Build is also used for the continuous delivery pipeline. The pipeline runs each time a commit is pushed to the candidate branch of 
the hello-cloudbuild-env repository. The pipeline applies the new version of the manifest to the Kubernetes cluster and, if successful, 
copies the manifest over to the production branch. This process has the following properties:
'
:'
-- The candidate branch is a history of the deployment attempts.
-- The production branch is a history of the successful deployments.
-- You have a view of successful and failed deployments in Cloud Build.
-- You can rollback to any previous deployment by re-executing the corresponding build in Cloud Build. A rollback also updates the production 
    branch to truthfully reflect the history of deployments.

Next you will modify the continuous integration pipeline to update the candidate branch of the hello-cloudbuild-env repository, 
triggering the continuous delivery pipeline.
'
