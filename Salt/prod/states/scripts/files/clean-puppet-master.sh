#!/bin/bash 
set +x 
ionice -c3 -p$$
renice 10 $$
#backup=/media/Backup/puppet/`hostname -s`/backup.puppet.`date +%Y-%m-%d`.tar.bz2
#log=/var/log/backup.log
#mkdir -p /media/Backup/puppet/`hostname -s`/ 2> /dev/null
#folders='/var/lib/puppet/'
#echo $backup $exclude $folders  $log $log-error
#echo  'folders and files'
#/bin/tar -czvf $backup $folders
find   /var/lib/puppet/bucket/ -type f -mmin +120 -amin +120 -print0 | xargs -0 rm  -f
find   /var/lib/puppet/clientbucket/ -type f -mmin +120 -amin +120 -print0 | xargs -0 rm -f
find   /var/lib/puppet/reports -type f -mmin +120 -amin +120 -print0 | xargs -0 rm -f

