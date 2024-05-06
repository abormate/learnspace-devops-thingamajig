# ------------------------------- #
#
# Cloud Monitoring - VMs
#
# ------------------------------- #

# Learn 

# Create a VM instance. Go to the navigation menu of the Console > select Compute Engine > VM instances

# Fill in the fields, leave other fields with their default values.

: '
Field	        Value
Name	        lamp-1-vm
Region	        us-central1
Zone	        us-central1-a
Series	        N1
Machine type	n1-standard-2
Boot disk	    Click Change. Select version Debian GNU/Linux 10 (buster) for Debian OS and click Select.
Firewall	    check Allow HTTP traffic

'

# Create VM instance