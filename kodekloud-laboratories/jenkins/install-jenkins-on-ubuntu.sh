#
# Once you're in an Ubuntu machine
# Update the machine first
#

sudo apt update -y

#
# Install first dependency which is Java dev kit
#
#

sudo apt install openjdk-11-jdk

#
# Next add repository key to the system
#
#

wget -q -O - https://pkg.jenkins.io/debian-stable/
sudo apt-key add -

#
# Next add Jenkins repo into aptitude package manager
# This means, we append the package repo to the server source list
#

sudo sh -c 'echo deb http://pkg.jenkins.io/debian-stable/ /etc/apt/sources.list.d/jenkins.list'

#
# Update the system once again
#

sudo apt update -y

#
# After the 2nd update, we can install Jenkins actually 
#

#
# Start Jenkins service after installation
#
#

sudo systemctl start jenkins

#
#
#
#







