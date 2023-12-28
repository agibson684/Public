#!/bin/bash 
export PATH=$PATH:/usr/bin
curl -fsSL https://bootstrap.saltproject.io -o install_salt.sh
chmod +x /root/install_salt.sh
mkdir /etc/salt/
echo 'datacenter: droplet \nenvironment: prod \nroles: \n  - droplet\n  - webpage_droplet\n  - consul_server\n  - remotedesktop\n '> /etc/salt/grains
echo '192.168.1.204  salt' >> /etc/hosts
/root/install_salt.sh,
salt-call state.highstate
					     
