# ------------------------------------------ #
#
# -- CronJobs in Kubernetes --
#
# ------------------------------------------ #

: '
There are some jobs/tasks that need to be run regularly on different schedules. 

Currently the Nautilus DevOps team is working on developing some scripts that will be 
executed on different schedules, but for the time being the team is creating some cron 
jobs in Kubernetes cluster with some dummy commands (which will be replaced by original 
scripts later). 

Create a cronjob as per details given below:

Create a cronjob named datacenter.


Set Its schedule to something like */4 * * * *, you set any schedule for now.


Container name should be cron-datacenter.


Use nginx image with latest tag only and remember to mention the tag i.e nginx:latest.


Run a dummy command echo Welcome to xfusioncorp!.


Ensure restart policy is OnFailure.

Note: The kubectl utility on jump_host has been configured to work with the kubernetes cluster.

'

# Go to official Kubernetes documentation page and check template for Cronjobs

: '
apiVersion: batch/v1
kind: CronJob
metadata:
  name: hello
spec:
  schedule: "* * * * *"
  jobTemplate:
    spec:
      template:
        spec:
          containers:
          - name: hello
            image: busybox:1.28
            imagePullPolicy: IfNotPresent
            command:
            - /bin/sh
            - -c
            - date; echo Hello from the Kubernetes cluster
          restartPolicy: OnFailure
'

# save template modified with correct details into file --> cronjob.yaml

kubectl create -f cronjob.yaml

kubectl get cronjob

kubectl describe cj nautilus