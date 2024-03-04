# -------------------------------------------------- #
#
# -- Rollback a current recent deployment --
#
# -------------------------------------------------- #

: '
This morning the Nautilus DevOps team rolled out a new release for one of the 
applications. Recently one of the customers logged a complaint which seems to be about 
a bug related to the recent release. Therefore, the team wants to rollback the recent 
release.

There is a deployment named nginx-deployment; roll it back to the previous revision.

Note: The kubectl utility on jump_host has been configured to work with the kubernetes
cluster.

'

kubectl get deployments

kubectl describe deployments nginx-deployment

kubectl rollout status deployment nginx-deployment

kubectl rollout history deployment nginx-deployment

kubectl rollout undo deployment nginx-deployment --to-revision=1

kubectl get deployments

kubectl describe deployments nginx-deployment