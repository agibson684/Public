#!/bin/bash 
export PATH=$PATH:/usr/bin
mkdir /etc/apt/keyrings
apt install curl  -y 
sudo curl -fsSL -o /etc/apt/keyrings/salt-archive-keyring-2023.gpg https://repo.saltproject.io/salt/py3/debian/11/amd64/SALT-PROJECT-GPG-PUBKEY-2023.gpg
echo "deb [signed-by=/etc/apt/keyrings/salt-archive-keyring-2023.gpg arch=amd64] https://repo.saltproject.io/salt/py3/debian/11/amd64/latest bullseye main" | sudo tee /etc/apt/sources.list.d/salt.list
cd /root/
curl -fsSL https://bootstrap.saltproject.io -o install_salt.sh
chmod +x /root/install_salt.sh
mkdir /etc/salt/
echo 'datacenter: home ' > /etc/salt/grains

echo 'environment: prod ' >> /etc/salt/grains

echo 'roles: ' >> /etc/salt/grains

echo '  - workstation' >> /etc/salt/grains

echo '  - mediashares' >> /etc/salt/grains

echo '  - consul_server '>> /etc/salt/grains

echo '  - shares  '>> /etc/salt/grains
echo '192.168.1.204  salt' >> /etc/hosts
/root/install_salt.sh
salt-call state.highstate
					     
