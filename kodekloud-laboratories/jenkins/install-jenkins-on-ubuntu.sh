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
#
#

