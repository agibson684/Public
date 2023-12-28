#!/bin/bash
##This script cleans  up camera pictures on  Gabrielle file server
##It runs every hour currently although check puppet as that might change in the future. 
##  
set -x
renice 10 $$
ionice -c3 -p$$
push_pid=`cat /var/run/camera.pid`
if [[ ! -z  "$push_pid" ]] ; then
 if [[  "$$" -ne  "$push_pid" ]] ; then
        echo 'script running'
          exit 1
 fi
fi
email() {
{
 echo  'To:  agibson684@gmail.com' 
 echo 'From: agibson684@gmail.com'  
 echo 'Subject: Broken Camera Sync please check CAMERAS'  
 echo 
 echo 
 echo 
 echo 'Broken Camera Sync please check CAMERAS' 
  } >> /tmp/Error.tmp
 /usr/bin/msmtp -v agibson684@gmail.com < /tmp/Error.tmp
 rm /var/run/camera.pid
exit 2
}
trap "bashtrap" TERM INT
        bashtrap ()
        {
                echo  'To:  agibson684@gmail.com' > /tmp/Error.tmp
                echo 'From: agibson684@gmail.com'  >> /tmp/Error.tmp
                echo 'Subject: Error! Broken Camera Sync please check CAMERAS'  >> /tmp/Error.tmp
                echo >> /tmp/Error.tmp
                echo >> /tmp/Error.tmp
                echo >> /tmp/Error.tmp
                cat /tmp/errorcode.tmp  >> /tmp/Error.tmp
                echo ' Broken Camera Sync please check CAMERAS' >>/tmp/Error.tmp
                /usr/bin/msmtp -v agibson684@gmail.com < /tmp/Error.tmp
                echo ' Broken Camera Sync please check CAMERAS'
		rm /var/run/camera.pid
exit 1
}
echo $$ > /var/run/camera.pid
find  /pool/PRIVATE/ -mtime +30 -exec rm -fv '{}' \;
rm /var/run/camera.pid
