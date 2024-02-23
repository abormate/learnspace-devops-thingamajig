# ---------------------------------------------- #
#
# -- Kubernetes -- Create Pods -- LearnSpace --
#
# ---------------------------------------------- #

: '
The Nautilus DevOps team has started practicing some pods and services deployment on 
Kubernetes platform as they are planning to migrate most of their applications on 
Kubernetes platform. Recently one of the team members has been assigned a task to 
create a pod as per details mentioned below:


Create a pod named pod-nginx using nginx image with latest tag only and remember to 
mention the tag i.e nginx:latest.

Labels app should be set to nginx_app, also container should be named as nginx-container.


Note: The kubectl utility on jump_host has been configured to work with the kubernetes 
cluster.

'

kubectl run pod-nginx --image=nginx:latest --dry-run=client -o yaml

# outputs ---
: '
apiVersion: v1
kind: Pod
metadata:
  creationTimestamp: null
  labels:
    run: pod-nginx
  name: pod-nginx
spec:
  containers:
  - image: nginx:latest
    name: pod-nginx
    resources: {}
  dnsPolicy: ClusterFirst
  restartPolicy: Always
status: {}

'

kubectl run pod-nginx --image=nginx:latest --dry-run=client -o yaml > pod.yaml

vim pod.yaml

cat pod.yaml

# must output the following ---
:'
apiVersion: v1
kind: Pod
metadata:
  creationTimestamp: null
  labels:
    app: nginx_app
  name: pod-nginx
spec:
  containers:
  - image: nginx:latest
    name: nginx-container
    resources: {}
  dnsPolicy: ClusterFirst
  restartPolicy: Always
status: {}

'

kubectl create -f pod.yaml

kubectl get pods

kubectl describe pod pod-nginx

# must output the following describe
: '
Name:             pod-nginx
Namespace:        default
Priority:         0
Service Account:  default
Node:             kodekloud-control-plane/172.17.0.2
Start Time:       Fri, 23 Feb 2024 02:10:53 +0000
Labels:           app=nginx_app
Annotations:      <none>
Status:           Running
IP:               10.244.0.5
IPs:
  IP:  10.244.0.5
Containers:
  nginx-container:
    Container ID:   containerd://f2cc4b54e9b1c089371a69d0bca59303d997baee70a75e8c9524a27f13ed71d2
    Image:          nginx:latest
    Image ID:       docker.io/library/nginx@sha256:c26ae7472d624ba1fafd296e73cecc4f93f853088e6a9c13c0d52f6ca5865107
    Port:           <none>
    Host Port:      <none>
    State:          Running
      Started:      Fri, 23 Feb 2024 02:11:03 +0000
    Ready:          True
    Restart Count:  0
    Environment:    <none>
    Mounts:
      /var/run/secrets/kubernetes.io/serviceaccount from kube-api-access-db22b (ro)
Conditions:
  Type              Status
  Initialized       True 
  Ready             True 
  ContainersReady   True 
  PodScheduled      True 
Volumes:
  kube-api-access-db22b:
    Type:                    Projected (a volume that contains injected data from multiple sources)
    TokenExpirationSeconds:  3607
    ConfigMapName:           kube-root-ca.crt
    ConfigMapOptional:       <nil>
    DownwardAPI:             true
QoS Class:                   BestEffort
Node-Selectors:              <none>
Tolerations:                 node.kubernetes.io/not-ready:NoExecute op=Exists for 300s
                             node.kubernetes.io/unreachable:NoExecute op=Exists for 300s
Events:
  Type    Reason     Age   From               Message
  ----    ------     ----  ----               -------
  Normal  Scheduled  113s  default-scheduler  Successfully assigned default/pod-nginx to kodekloud-control-plane
  Normal  Pulling    112s  kubelet            Pulling image "nginx:latest"
  Normal  Pulled     103s  kubelet            Successfully pulled image "nginx:latest" in 8.821052242s (8.821065601s including waiting)
  Normal  Created    103s  kubelet            Created container nginx-container
  Normal  Started    103s  kubelet            Started container nginx-container

'