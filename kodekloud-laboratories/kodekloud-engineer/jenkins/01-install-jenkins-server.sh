# ------------------------------------------ #
#
# -- Install and Configure -- Jenkins -- 
#
# ------------------------------------------ #

: '
The DevOps team of xFusionCorp Industries is planning to setup some 
CI/CD pipelines. After several meetings they have decided to use 
Jenkins server. 

So, we need to setup a Jenkins Server as soon as possible. 
Please complete the task as per requirements mentioned below:

1. Install jenkins on jenkins server using yum utility only, and 
start its service. You might face timeout issue while starting the 
Jenkins service, please refer this link for help.

2. Jenkins admin user name should be theadmin, password should be ***, 
full name should be Rose and email should be ***@****.com.

'

ssh ***@***

yum install java -y

curl --silent --location http://pkg.jenkins-ci.org/redhat-stable/jenkins.repo | sudo tee /etc/yum.repos.d/jenkins.repo

sudo rpm --import https://jenkins-ci.org/redhat/jenkins-ci.org.key

yum install jenkins -y

# remember to install supported java dependency versions 11, 17, or 21 prior