# ------------------------------ #
#
# Add Apache HTTP server to your instance
#
# ------------------------------ #

# Learn 

# Activate and connect to instance "lamp-1-vm" via SSH to open a terminal to your instance
# Set up Apache2 HTTP server in your instance

sudo apt-get update

sudo apt-get install apache2 php7.0

# Note: If you cannot install PHP 7, try PHP 5 instead.

sudo service apache2 restart


