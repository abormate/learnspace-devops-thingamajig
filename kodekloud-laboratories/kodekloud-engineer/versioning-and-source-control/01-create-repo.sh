# ------------------------------------------------ #
#
# -- Git -- Source and Version Control -- 
#
# ------------------------------------------------ #

: '
The Nautilus development team shared requirements with the DevOps 
team regarding new application development.—specifically, they want 
to set up a Git repository for that project. 

Create a Git repository on Storage server in Stratos DC as per 
details given below:


1. Install git package using yum on Storage server.

2. After that create a bare repository /opt/beta.git 
(make sure to use exact name).

'

ssh worker@ststor01

cat /etc/os-release

sudo su -

yum --version

yum -y install git

