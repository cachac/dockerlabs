#!/bin/bash -x

# user
adduser ${username} --gecos "$fullname,RoomNumber,WorkPhone,HomePhone" --disabled-password
echo -e "password\npassword\n" | passwd ${username}
passwd --expire ${username}
adduser ${username} sudo
mkdir -p /home/${username}/.ssh
cp ~/.ssh/authorized_keys /home/${username}/.ssh/
chown ${username}:${username} /home/${username}/.ssh/authorized_keys
chmod 600  /home/${username}/.ssh/authorized_keys

# docker
curl -fsSL https://get.docker.com -o get-docker.sh | sh
sudo usermod -aG docker ${username}
newgrp docker

# docker-compose
sudo curl -L "https://github.com/docker/compose/releases/download/1.29.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
sudo ln -s /usr/local/bin/docker-compose /usr/bin/docker-compose
