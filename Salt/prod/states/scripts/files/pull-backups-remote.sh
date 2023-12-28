#!/bin/bash
set -x
echo $(date +%Y-%m-%d-%T)
renice 10 $$
ionice -c3 -p$$
local_dir='/media/backup'
remote_dir='/pool/BACkUP'
backup_svr='home.thrace-lan.info'
email='agibson684@gmail.com'
email() {
{
 echo  "To: $email"
 echo  "From: $email"
 echo 'Subject: Broken Backup Pull please check directories' 
 echo
 echo
 echo
 echo 'Broken Backup Pull please check directories'
      $(date +%Y-%m-%d-%T)
} >> /tmp/Error.tmp
 /usr/bin/msmtp -v $email < /tmp/Error.tmp
 exit 2
}
trap "bashtrap" TERM INT
        bashtrap ()
        {
         echo "To: $email"
         echo "From: $email"
         echo 'Subject: Error! Backup pull Failure'
         echo >> /tmp/Error.tmp
         echo >> /tmp/Error.tmp
         echo >> /tmp/Error.tmp
         cat /tmp/errorcode.tmp
         echo 'Broken Backup due to termination or interrupt'
         $(date +%Y-%m-%d-%T)
         echo 'Error Broken Backup pull '
         >> /tmp/Error.tmp }
     /usr/bin/msmtp -v $email < /tmp/Error.tmp
exit 1
}
if ping -c1 "$backup_svr";  then
 FILES=("$local_dir"/*/backup.*.bz2.done); 
  if [ -e "${FILES[0]}" ] ; then
     if scp  "$local_dir"/"$(hostname)"/backup.*.bz2.* erin@"$backup_svr":"$remote_dir"/"$(hostname)"/daily/; then
    exit 0
  fi
 exit 1
 fi
fi
exit 0

