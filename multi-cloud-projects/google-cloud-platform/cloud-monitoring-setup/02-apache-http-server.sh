# ------------------------------- #
#
#  Install Apache 2 HTTP server to your Compute instance 
#
# ------------------------------- #

# From the console, SSH to "lamp-1-vm" to open a terminal to your instance

# Set up Apache2 HTTP server

sudo apt-get update

sudo apt-get install apache2 php7.0

# If you have trouble installing PHP 7.0 -- then you can try instead, PHP 5

sudo service apache2 restart

# Now, you'll need to install monitoring and logging agents to your server(s)

# Agents collect data and then send or stream info to Cloud Monitoring in the Cloud Console
: '
The Cloud Monitoring agent is a collected-based daemon that gathers system and application metrics from 
virtual machine instances and sends them to Monitoring. By default, the Monitoring agent collects disk, CPU, 
network, and process metrics. Configuring the Monitoring agent allows third-party applications to get the full 
list of agent metrics.
'

# GCP operations website --> Cloud Monitoring documentation --> https://cloud.google.com/monitoring/docs#

# You'll install the Cloud Logging agents to stream logs from your VM instances to Cloud Logging.
# It is best practice, to run the Cloud Logging agent on all your VM instances.

# Run monitoring agent install script from the SSH terminal of your VM instance to install logging agent
curl -sSO https://dl.google.com/cloudagents/add-google-cloud-ops-agent-repo.sh

sudo bash add-google-cloud-ops-agent-repo.sh --also-install

# When asked if you want to continue, enter Y
