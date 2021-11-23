#!/bin/bash -x

# docker
curl -fsSL https://get.docker.com -o get-docker.sh
sudo sh get-docker.sh
sudo usermod -aG docker ${username}
# newgrp docker

# docker-compose
sudo curl -L "https://github.com/docker/compose/releases/download/1.29.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
sudo ln -s /usr/local/bin/docker-compose /usr/bin/docker-compose

# git cachac
runuser -l ${username} -c  'git clone https://github.com/cachac/dockerlabs.git'

# ssh-keygen -f "/home/cachac/.ssh/known_hosts" -R "lab1.dockerlabs.tk"
