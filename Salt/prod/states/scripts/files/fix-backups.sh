#!/bin/bash
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

servers=(
'xena'
'gabrielle'
'solan'
'eve'
'joxer'
'testing'
'services'
'aries'
'calisto'
'terreis'
'lyceus'
'ephiny'
'cyane'
'athena'
'mediacenter'
'kodi'
'cyrene'
)
for i in "${servers[@]}";do
touch /pool/BACKUP/"${i}"/backup.day*.bz2.done
touch /pool/BACKUP/"${i}"/backup.week*.bz2.done
touch /pool/BACKUP/"${i}"/backup.month*.bz2.done
done
exit 0

