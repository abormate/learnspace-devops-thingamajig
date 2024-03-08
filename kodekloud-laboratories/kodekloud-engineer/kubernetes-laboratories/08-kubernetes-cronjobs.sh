# ------------------------------------------ #
#
# -- CronJobs in Kubernetes --
#
# ------------------------------------------ #

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

kubectl get cj

kubectl describe cj nautilus