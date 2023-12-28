#!/bin/bash
#set -x
# should make scp command into an array for the .done files,
#maybe check if that days .done file is still there, or if there are older days?
#see if this can be done via pid?
echo $(date +%Y-%m-%d-%T)
renice 10 $$
ionice -c3 -p$$
local_dir='/media/Backup'
remote_dir='/pool/BACKUP'
backup_svr='home.thrace-lan.info'
email='agibson684@gmail.com'
port='2010'
exit_ping=''
log='/var/log/pullbackup.log'
errorlog='/var/log/pullbackuperror.log'
email() {
 #this hase to be a single direct to remove old crap from error.tmp
 { echo  "To:  $email"  > /tmp/Error.tmp;}
 { echo  "From: $email" >> /tmp/Error.tmp;}
 { echo 'Subject: Broken Backup Pull please check directories'>> /tmp/Error.tmp ;}
 { echo >> /tmp/Error.tmp;}
 { echo >> /tmp/Error.tmp;}
 { echo >> /tmp/Error.tmp;}
 { echo 'Broken Backup Pull please check directories' >> /tmp/Error.tmp;}
  /usr/bin/msmtp -v $email < /tmp/Error.tmp
exit 2
}
trap "bashtrap" TERM INT
        bashtrap ()
        {
#this has to be a single direct to remove old stuff
   { echo  "To:  $email" > /tmp/Error.tmp;} 
   { echo "From:  $email" >> /tmp/Error.tmp;}
   { echo 'Subject: Error! Backup pull Failure' >> /tmp/Error.tmp;}
   { echo >> /tmp/Error.tmp;}
   { echo >> /tmp/Error.tmp ;}
   { echo >> /tmp/Error.tmp ;}
   { echo 'Broken Backup pull due to termination or interrupt' >> /tmp/Error.tmp ;}
     /usr/bin/msmtp -v $email < /tmp/Error.tmp
     { echo 'Error Broken Backup pull ';}
exit 1
}
trap "bashexit" EXIT
bashexit ()
        {
          rm -f /var/run/backup.pid
        exit 0
        }
backup_pid=$(cat /var/run/backup.pid)
if [[ ! -z  "$backup_pid" ]] ; then
 if [[  "$$" -ne  "$backup_pid" ]] ; then
        echo 'script running'
          email
          exit 1
 fi
fi
function debug {
set -x
}
echo $$ > /var/run/backup.pid
if ping -c1 "$backup_svr";  then
 FILES=("$local_dir"/*/backup.*.bz2.done);
  if [ -e "${FILES[0]}" ] ; then
   if scp  -P "$port" "$local_dir"{{ grains['host'] }}/backup.*.bz2 erin@"$backup_svr":"$remote_dir"/{{ grains['host'] }}/ 1>>"$log" 2>>"$errorlog" ; then
   rm "$local_dir"/*/backup.*.bz2.done
   rm "$local_dir"/*/backup.*.bz2
   exit 0
   fi
   echo "I can not copy the remote backups from <%= @hostname %>"
   email
   exit 1
  fi
  #second to last if then that checks if there  is a .done file if not exit 0 we have nothing to do.
  exit 0
fi
if [ -z "$exit_ping" ]; then
 exit 0
 fi
email
exit "$exit_ping" 

