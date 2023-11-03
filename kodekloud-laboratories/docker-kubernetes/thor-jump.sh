: '

The Nautilus DevOps team met with the application development team and decided to containerize several of their 
applications. The DevOps team wants to do some testing per the following:

'

# Tasked to install docker-ce on CentOS server
sudo yum install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

# Install docker compose on CentOS server
sudo curl -L "https://github.com/docker/compose/releases/download/1.23.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose


# Start docker-ce
sudo systemctl start docker

