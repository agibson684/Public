#!/bin/bash 
echo 'upgrading with aptitude non interactive'
export DEBIAN_FRONTEND=noninteractive
/usr/bin/aptitude safe-upgrade -q -y -o Dpkg::Options::="--force-confdef" -o Dpkg::Options::="--force-confold"
