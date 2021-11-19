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
