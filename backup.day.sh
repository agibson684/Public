#!/bin/bash 

ionice -c3 -p$$
renice 10 $$
exclude=/home/THRACE/erin/bin/exclude.txt
backup=/media/Backup/`hostname`/backup.day.`date +%Y-%m-%d`.tar.bz2
log=/var/log/backup.log
log-error=/var/log/backup.err
folders='/etc /root /home /media/private /media/public'
echo $backup $exclude  $folders   $log $log-error
/bin/tar -cjvf $backup -X $exclude  $folders  1>> $log 2>> $log-error
touch  $backup.done

