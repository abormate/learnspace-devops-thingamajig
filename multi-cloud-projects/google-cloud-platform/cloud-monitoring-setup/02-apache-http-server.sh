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
