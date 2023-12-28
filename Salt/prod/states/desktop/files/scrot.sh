#!/bin/bash 
#display to open the pic and crop
#making the directory in case user does not have it 
mkdir -p ~/Documents/scrot
scrot   -s -q 50 -e 'mv $f ~/Documents/scrot'
if [ "$1" = "post" ] ; then 
uploadpic=$( find ~/Documents/scrot/ -type f -mmin -1 -iname "*.png" | head -n 1) 
uploadpicname=$(basename -- "$uploadpic")
scp  "$uploadpic" root@zeus:/var/www/personal/images/
ssh zeus chown www-data:www-data /var/www/personal/images/*.png
firefox  "https://zeus.thrace-lan.info/personal/images/$uploadpicname"
fi

