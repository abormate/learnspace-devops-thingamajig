# List active acct name on logged in user to console
gcloud auth list

# List project ID active on session current
gcloud config list project

# Create new cloud source repo with name "REPO_DEMO"
gcloud source repos create REPO_DEMO

# Clone remote repo to your local Linux workspace / Cloud shell session from GCP
gcloud source repos clone REPO_DEMO

# from pwd
cd REPO_DEMO

# append string "Hello World" to a txt file
echo 'Hello World!' > myfile.txt


