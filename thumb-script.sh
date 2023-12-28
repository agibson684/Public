#!/bin/bash
set -x 
        trap "bashtrap" TERM INT EXIT
        bashtrap ()
        {
        rm -rfv /media/Backup/usb-archive/*
	#this cleans out the backups so we dont fill up. there is no check to see if its full!
	find /mnt/usb1/ -type f -mtime +3 -exec rm -v  '{}' \;
	umount /mnt/usb1 2>/dev/null
	umount /mnt/usb2  2>/dev/null
	umount /mnt/usb3   2>/dev/null
	rm -f /var/run/thumb.pid
	rm -f  /tmp/backup.day.usb.$(date +%Y-%m-%d).tar.bz2*
	rm -f /tmp/Error.tmp
	#chown erin:'domain users' /media/private/erin/ 
	#chmod 700 /media/private/erin/
	#send email to root now. 
	exit
        }
thumb_pid=`cat /var/run/thumb.pid`
usb1='/mnt/usb1'
usb2='/mnt/usb2'
usb3='/mnt/usb3'
source='/media/Backup/usb-archive'
hostnames='gabrielle xena eve solan joxer lyceus services'
GOOD=0
  if [[ ! -z  "$thumb_pid" ]] ; then
  if [[  "$$" -ne  "$thumb_pid" ]] ; then
        echo 'thumb script running'
        kill -9  ${thumb_pid}
fi
  fi
  echo $$
  FILES=(/var/run/thumb.pid); if [[ -e "$FILES" ]] ; then
  echo 'thumb script running'
  exit 
fi
echo $$ > /var/run/thumb.pid
while [ "$GOOD" != "1" ]
do
sleep 10
  FILES=(/tmp/gabrielle.done); if [ -e "$FILES" ] ; then
  FILES=(/tmp/xena.done); if [ -e "$FILES" ] ; then
  FILES=(/tmp/eve.done); if [ -e "$FILES" ] ; then
  FILES=(/tmp/solan.done); if [ -e "$FILES" ] ; then
  FILES=(/tmp/joxer.done); if [ -e "$FILES" ] ; then
  FILES=(/tmp/lyceus.done); if [ -e "$FILES" ] ; then
  FILES=(/tmp/services.done); if [ -e "$FILES" ] ; then
  FILES=(/tmp/testing.done); if [ -e "$FILES" ] ; then
GOOD=1
echo  'success!' 
fi
fi
fi
fi
fi
fi
fi
fi
 done
 for hostname in gabrielle xena eve solan joxer lyceus services testing; do ls -l  /media/Backup/${hostname}/daily/backup.day.`date +%Y-%m-%d`.tar.bz2; done
 if [ $? ==  0 ] ;  then
	 for hostname in gabrielle xena eve solan joxer lyceus services testing ; do ln -s   /media/Backup/${hostname}/daily/backup.day.`date +%Y-%m-%d`.tar.bz2 ${source}/${hostname}.tar.bz2; done
	ln -s /media/private ${source}
	echo 'linking private'
	ln -s /media/public  ${source}
	echo 'linking public'
else
#send email when things go awry
echo  'To:  agibson684@gmail.com' > /tmp/Error.tmp
echo 'From: agibson684@gmail.com'  >> /tmp/Error.tmp
echo 'Subject:  Error! Thumbs not Sync!!'  >> /tmp/Error.tmp
echo >> /tmp/Error.tmp
echo >> /tmp/Error.tmp
echo >> /tmp/Error.tmp
echo 'ALARM! ERROR! Thumbs NOT Sync! ' >> /tmp/Error.tmp
/usr/sbin/ssmtp -vvv agibson684@gmail.com < /tmp/Error.tmp
echo BROKE-FI
   exit 1  
fi
#mount drives here using variables
#Files
mount ${usb1}
#Backup key
mount ${usb2}
#Backup
mount ${usb3}
	if [ $? ==  0 ] ;  then 
	#list the keys  and export the  keys! 
	 mkdir -p ${source}/keys
	gpg  --list-keys > ${source}/keys/keys.txt
	gpg --export   > ${source}/keys/keys
	#extract the DB and key
	/bin/tar -xjvvf  ${source}/gabrielle.tar.bz2  -C ${source}  srv/  >/dev/null
		if [ $? ==  0 ] ;  then
		#create the backups and put it in the usb1 key!
		/bin/tar -chjvf   /tmp/backup.day.usb.$(date +%Y-%m-%d).tar.bz2  ${source}  > /dev/null
		else
	 	#send email when things go awry
                echo  'To:  agibson684@gmail.com' > /tmp/Error.tmp
                echo 'From: agibson684@gmail.com'  >> /tmp/Error.tmp
                echo 'Subject:  Error! Thumbs not Sync!!'  >> /tmp/Error.tmp
                echo >> /tmp/Error.tmp
                echo >> /tmp/Error.tmp
                echo >> /tmp/Error.tmp
                echo 'ALARM! ERROR! Thumbs NOT Sync! ' >> /tmp/Error.tmp
                /usr/sbin/ssmtp -vvv agibson684@gmail.com < /tmp/Error.tmp
                echo BROKE-FI
		exit 1
		fi
			if [ $? ==  0 ] ;  then
			gpg -u Erin_Private -r Erin_Private --armor -e   /tmp/backup.day.usb.$(date +%Y-%m-%d).tar.bz2
			else
			  #send email when things go awry
	                echo  'To:  agibson684@gmail.com' > /tmp/Error.tmp
        	        echo 'From: agibson684@gmail.com'  >> /tmp/Error.tmp
                	echo 'Subject:  Error! Thumbs not Sync!!'  >> /tmp/Error.tmp
	                echo >> /tmp/Error.tmp
	                echo >> /tmp/Error.tmp
        	        echo >> /tmp/Error.tmp
	                echo 'ALARM! ERROR! Thumbs NOT Sync! ' >> /tmp/Error.tmp
        	        /usr/sbin/ssmtp -vvv agibson684@gmail.com < /tmp/Error.tmp
	                echo BROKE-FI
			exit 1	
			fi
		##sync back changes from server
        	#rsync -rvzP  -c /media/private/erin/ /mnt/usb3 --exclude='/cyane' --exclude='Repository/.git' --exclude='Repository/keys' --exclude='Repository/Budget/Backup/' 
		##sync my files with the  server. minus the keys
		#rsync -rvzP -c $usb3/ /media/private/erin --exclude='/cyane' --exclude='Repository/.git' --exclude='Repository/keys' --exclude='Repository/Budget/Backup/' 
		## sync the  backup now.
		cp -RvfL  /tmp/backup.day.usb.$(date +%Y-%m-%d).tar.bz2.asc  ${usb1}
		if [ $? ==  0 ] ;  then
		##sync the keys to usb2
		rsync -rvzP  ${source}/keys  ${usb2}
		##Sync the database of passwords and key 
		rsync -rvzP  ${source}/srv  ${usb2}
		else 	 
		#send email when things go awry
		echo  'To:  agibson684@gmail.com' > /tmp/Error.tmp
		echo 'From: agibson684@gmail.com'  >> /tmp/Error.tmp
		echo 'Subject:  Error! Thumbs not Sync!!'  >> /tmp/Error.tmp
		echo >> /tmp/Error.tmp
		echo >> /tmp/Error.tmp
		echo >> /tmp/Error.tmp
		echo 'ALARM! ERROR! Thumbs NOT Sync! ' >> /tmp/Error.tmp
		/usr/sbin/ssmtp -vvv agibson684@gmail.com < /tmp/Error.tmp
		echo BROKE-FI
		exit 1
		fi
	#sync the keys to usb2
	rsync -rvzP  ${source}/keys  ${usb2}
	##Sync the database of passwords and key 
	rsync -rvzP  ${source}/srv  ${usb2}
	else
#send email when things go awry
echo  'To:  agibson684@gmail.com' > /tmp/Error.tmp
echo 'From: agibson684@gmail.com'  >> /tmp/Error.tmp
echo 'Subject:  Error! Thumbs not Sync!!'  >> /tmp/Error.tmp
echo >> /tmp/Error.tmp
echo >> /tmp/Error.tmp
echo >> /tmp/Error.tmp
echo 'ALARM! ERROR! Thumbs NOT Sync! ' >> /tmp/Error.tmp
/usr/sbin/ssmtp -vvv agibson684@gmail.com < /tmp/Error.tmp
echo BROKE-FI
exit 1
fi
FILES=(/mnt/usb1/backup.day.usb.$(date +%F).tar.bz2.asc); if [ -a "$FILES" ] ; then
	rm -f /tmp/*.done 
	echo 'removing .done files!'	
	exit 0
	else
#send email when things go awry
echo  'To:  agibson684@gmail.com' > /tmp/Error.tmp
echo 'From: agibson684@gmail.com'  >> /tmp/Error.tmp
echo 'Subject:  Error! Thumbs not Sync!!'  >> /tmp/Error.tmp
echo >> /tmp/Error.tmp
echo >> /tmp/Error.tmp
echo >> /tmp/Error.tmp
echo 'ALARM! ERROR! Thumbs NOT Sync! ' >> /tmp/Error.tmp
 /usr/sbin/ssmtp -vvv agibson684@gmail.com < /tmp/Error.tmp
	echo   BROKE-FI2
	exit 1
	fi

