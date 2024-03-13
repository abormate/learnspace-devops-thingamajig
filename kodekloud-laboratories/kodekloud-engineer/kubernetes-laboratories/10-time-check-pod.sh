# ------------------------------------------------ #
#
# -- Kode Kloud Engineer -- Kubernetes -- Time Check Pod --
#
# ------------------------------------------------ #

: '


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