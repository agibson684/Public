#!/bin/bash 
backup="/media/Backup/"$hostname"/backup.day.$(date +%Y-%m-%d).tar.bz2"
log='/var/log/dead.letter.log'  
 if [ -e  "/root/dead.letter" ] ; then 
echo  'To:  agibson684@gmail.com' > /tmp/wakeup.tmp
echo 'From: agibson684@gmail.com'  >> /tmp/wakeup.tmp
echo 'Subject: dead.letter found!'  >> /tmp/wakeup.tmp
echo >> /tmp/wakeup.tmp
echo >> /tmp/wakeup.tmp
echo >> /tmp/wakeup.tmp
cat /root/dead.letter  >> /tmp/wakeup.tmp

if /usr/bin/msmtp -v agibson684@gmail.com < /tmp/wakeup.tmp; then
rm  -f /root/dead.letter
fi
fi
