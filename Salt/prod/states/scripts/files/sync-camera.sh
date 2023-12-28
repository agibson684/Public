#!/bin/bash
##This script syncs up camera pictures to Gabrielle file server
##It runs every hour currently although check puppet as that might change in the future. 
## It does delete any files. It does has logic to check 
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
host=(
'36'
'34'
'32'
'30'
'28'
)
camera=(
'1'
'2'
'3'
'4'
)
for i in "${host[@]}";do
  for y in "${camera[@]}"; do
    sshpass -p "6Fn5aeAc:V" rsync -P --remove-source-files -avu -e "ssh -o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null -p 22  -o ConnectTimeout=60" admin@192.168.1."${i}":/home/ftp/sdcard/Camera"${y}"/* /pool/PRIVATE/"${i}"/
      if [ $? ==  0 ] ;  then
        sshpass -p "6Fn5aeAc:V" ssh -o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null admin@192.168.1."${i}" -o ConnectTimeout=60  "rmdir /home/ftp/sdcard/Camera${y}/*"
      fi
done
 done
 rm /var/run/camera.pid

exit



