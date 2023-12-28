#!/bin/bash 
ionice -c3 -p$$
renice 10 $$
#exclude=/root/bin/exclude.txt
#backup=/media/private/erin/Repository/Budget/backup/backup.day.budget.`date +%Y-%m-%d`.tar.bz2
#log=/var/log/backup.log
#log-error=/var/log/backup.err
#folders='/media/private/erin/Repository/Budget/*.xls'
#echo $backup $exclude  $folders   $log $log-error
cp -va  /media/private/erin/Repository/Budget/Budget.xls /media/private/erin/Repository/Budget/Backup/Budget.`date +%Y-%m-%d-%T`.xls
#/bin/tar -cjvf $backup -X $exclude  $folders  1>> $log 2>> $log-error

