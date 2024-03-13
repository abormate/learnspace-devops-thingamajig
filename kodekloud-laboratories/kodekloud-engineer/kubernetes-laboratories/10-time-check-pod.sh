# ------------------------------------------------ #
#
# -- Kode Kloud Engineer -- Kubernetes -- Time Check Pod --
#
# ------------------------------------------------ #

: '
The Nautilus DevOps team want to create a time check pod in a particular Kubernetes 
namespace and record the logs. This might be initially used only for testing purposes, 
but later can be implemented in an existing cluster. Please find more details below 
about the task and perform it.

'

kubectl get namespace 

kubectl create namespace <name>

kubectl get namespace

# get config map from Kubernetes documentation

: '
apiVersion: v1
kind: ConfigMap
metadata:
  name: game-demo
data:
  # property-like keys; each key maps to a simple value
  player_initial_lives: "3"
  ui_properties_file_name: "user-interface.properties"


'