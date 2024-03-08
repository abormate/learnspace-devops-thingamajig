# ------------------------------------------ #
#
# -- CronJobs in Kubernetes --
#
# ------------------------------------------ #

# Go to official Kubernetes documentation page and check template for Cronjobs

# save template modified with correct details into file --> cronjob.yaml

kubectl create -f cronjob.yaml

kubectl get cj

kubectl describe cj nautilus