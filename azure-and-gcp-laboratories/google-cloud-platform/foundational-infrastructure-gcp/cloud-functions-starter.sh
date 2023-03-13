# ------------------------------- #
#
# Cloud Functions - quick start
#
# ------------------------------- #

# What is serverless?
: '
Cloud Functions removes the work of managing servers, configuring software, updating frameworks, 
and patching operating systems. The software and infrastructure are fully managed by Google so that 
you just add code. Furthermore, provisioning of resources happens automatically in response to events. 

This means that a function can scale from a few invocations a day to many millions of invocations without 
any work from you.
'

# Setup

# list active account name
gcloud auth list

# After authorization -- list the project ID 
gcloud config list project


# --------------------------------- #
#
# Task 1 - create a function
#
# --------------------------------- #

# With the shell, create a directory for code
mkdir gcf_hello_world

