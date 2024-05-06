


git config --global user.email ab@test-domain.com                                             
git config --global user.name abraham

gcloud artifacts repositories create my-repository \
  --repository-format=docker \
  --location=us-central1

gcloud container clusters create hello-cluster --num-nodes 3 --region us-central1-a --enable-autoscaling --max-nodes 6 --min-nodes 2 --release-channel regular

kubectl create namespace prod && \
kubectl create namespace dev

kubectl get namespace

gcloud source repos create sample-app

gcloud source repos clone sample-app --project=project ID

cd ~
gsutil cp -r gs://spls/gsp330/sample-app/* sample-app

# push file contents new -- to master branch