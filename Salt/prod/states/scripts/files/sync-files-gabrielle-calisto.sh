#!/bin/bash
##This script syncs up Gabrille file server with Calisto fileserver in my Thrace.lan Environment.
##It runs every hour currently although check puppet as that might change in the future. 
## It does delete any files. It does has logic to check 
set -x
renice 10 $$
ionice -c3 -p$$
email() {
{
 echo  'To:  agibson684@gmail.com' 
 echo 'From: agibson684@gmail.com'  
 echo 'Subject: Broken Backup Pull please check directories'  
 echo 
 echo 
 echo 
 echo 'Broken Backup Pull please check directories' 
  } >> /tmp/Error.tmp
 /usr/bin/msmtp -v agibson684@gmail.com < /tmp/Error.tmp
exit 2
}
trap "bashtrap" TERM INT
        bashtrap ()
        {
                echo  'To:  agibson684@gmail.com' > /tmp/Error.tmp
                echo 'From: agibson684@gmail.com'  >> /tmp/Error.tmp
                echo 'Subject: Error! Backup pull Failure'  >> /tmp/Error.tmp
                echo >> /tmp/Error.tmp
                echo >> /tmp/Error.tmp
                echo >> /tmp/Error.tmp
                cat /tmp/errorcode.tmp  >> /tmp/Error.tmp
                echo 'Broken Backup due to termination or interrupt' >>/tmp/Error.tmp
                /usr/bin/msmtp -v agibson684@gmail.com < /tmp/Error.tmp
                echo 'Error Broken Backup pull '
exit 1
}

folders=(
'MISC'
'APPS'
'MUSIC'
'MOVIES'
)
for i in "${folders[@]}";do
rsync -P --remove-source-files -avu -e "ssh -o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null -i \"/home/sync_user/.ssh/sync-files\" -p 22 " sync_user@gabrielle:/pool/"${i}"/ /pool/"${i}"/ 
  if [ $? ==  0 ] ;  then
   ssh -o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null -i /home/sync_user/.ssh/sync-files sync_user@gabrielle.thrace.lan "rmdir /pool/"${i}"/*"
    fi
done
exit 0

