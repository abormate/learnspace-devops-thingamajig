# ---------------------------------- #
#
# Install version control Git
#
# ---------------------------------- #

# identify the version of Linux you're at
cat /etc/os-release

# or 

cat /etc/*release*

# update apt package library

sudo apt update

# install git on Debian-based distro like Ubuntu 

sudo apt install git -y

# verify git is already installed in your local machine

git --version

# explore git commands 

git help

# Show various types of objects

git show

# List, create, or delete branches

git branch

# Download objects from another repository

git fetch

# When starting -- to create an empty Git repository or re-initialize an existing one

git init 