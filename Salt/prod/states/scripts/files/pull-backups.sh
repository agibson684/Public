#!/bin/bash
set -x
renice 10 $$
ionice -c3 -p$$
log=/var/log/backup-pull.log
logerror=/var/log/backup-pull-error.log
email() {
                { echo  'To:  agibson684@gmail.com' > /tmp/Error.tmp;}
                { echo 'From: agibson684@gmail.com'  >> /tmp/Error.tmp;}
                { echo 'Subject: Error! Backup Pull Failure!'  >> /tmp/Error.tmp;}
                { echo "$code" >>/tmp/errorcode.tmp;}
                { echo "$code" >>/tmp/Error.tmp;}  
                { echo >> /tmp/Error.tmp;}
                { echo >> /tmp/Error.tmp;}
                { echo >> /tmp/Error.tmp;}
                { echo  "${folders[@]}"        >> /tmp/Error.tmp;}
                { echo  "$log"            >> /tmp/Error.tmp;}
                { echo  "$backup"         >> /tmp/Error.tmp;}
                { echo 'Broken Backup due to none zero exit code!' >> /tmp/Error.tmp;}
                { cat /tmp/errorcode.tmp  >> /tmp/Error.tmp;}
		 curl -s \
                --form-string "token={{ salt['pillar.get']('pushtoken') }}" \
                --form-string "user={{ salt['pillar.get']('pushuser') }}" \
                --form-string "message=$(cat /tmp/Error.tmp)" \
                https://api.pushover.net/1/messages.json
              #  /usr/bin/msmtp --auto-from=off --from=agibson684@gmail.com --maildomain=thrace-lan.info -v agibson684@gmail.com < /tmp/Error.tmp
                { echo 'Error Pull Broken Backup';}
                { echo 'Error Pull  Broken Backup' >> "$logerror";}
		rm -f /tmp/errorcode  /tmp/Error.tmp
}
trap "bashtrap" TERM INT
        bashtrap ()
        {
		{ echo  'To:  agibson684@gmail.com' > /tmp/Error.tmp;}
                { echo 'From: agibson684@gmail.com'  >> /tmp/Error.tmp;}
                { echo 'Subject: Error! Backup Pull Failure!'  >> /tmp/Error.tmp;}
                { echo "$code" >>/tmp/errorcode.tmp;}
                { echo "$code" >>/tmp/Error.tmp;} 
                { echo >> /tmp/Error.tmp;}
                { echo >> /tmp/Error.tmp;}
                { echo >> /tmp/Error.tmp;}
                { echo  "${folders[@]}"   >> /tmp/Error.tmp;}
                { echo  "$log"            >> /tmp/Error.tmp;}
                { echo  "$backup"         >> /tmp/Error.tmp;}
		{ cat /tmp/errorcode.tmp  >> /tmp/Error.tmp;}
                { echo 'Broken Pull Backup due to termination or interrupt!' >> /tmp/Error.tmp;}
		 curl -s \
                --form-string "token={{ salt['pillar.get']('pushtoken') }}" \
                --form-string "user={{ salt['pillar.get']('pushuser') }}" \
                --form-string "message=$(cat /tmp/Error.tmp)" \
                https://api.pushover.net/1/messages.json
               # /usr/bin/msmtp --auto-from=off --from=agibson684@gmail.com --maildomain=thrace-lan.info -v agibson684@gmail.com < /tmp/Error.tmp
                { echo 'Error Pull Broken Backup';}
                { echo 'Error Pull Broken Backup' >> "$logerror";}
                 echo "$code"
		  rm -f /tmp/errorcode  /tmp/Error.tmp
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
'docker'
)

FILES=(/pool/BACKUP/*/backup.*.bz2.done); if [ -e "${FILES[$j]}" ] ; then
for i in "${servers[@]}";do
if [ ! -e  /pool/BACKUP/"${i}" ] ; then 
mkdir /pool/BACKUP/"${i}"
mkdir /pool/BACKUP/"${i}"/{daily,weekly,monthly}
fi
FILES=(/pool/BACKUP/*/backup.*.bz2); if [ -e "${FILES[0]}" ] ; then

 FILES=(/pool/BACKUP/*/backup.*.bz2.done); if [ -e "${FILES[0]}" ] ; then

  FILES=(/pool/BACKUP/"${i}"/backup.day*.bz2.done); if [ -e "${FILES[0]}" ] ; then

   mv -v /pool/BACKUP/"${i}"/backup.day*.bz2 /pool/BACKUP/"${i}"/daily/
fi

 fi

  fi
    FILES=(/pool/BACKUP/"${i}"/backup.day*.bz2.done); if [ -e "${FILES[0]}" ] ; then

    FILES=(/pool/BACKUP/"${i}"/backup.day*.bz2); if [ ! -e "${FILES[0]}" ] ; then

     rm -f /pool/BACKUP/"${i}"/backup.day*.bz2.done
fi

fi

 FILES=(/pool/BACKUP/"${i}"/backup.week*.bz2.done); if [ -e "${FILES[0]}" ] ; then

  mv -v /pool/BACKUP/"${i}"/backup.week*.bz2  /pool/BACKUP/"${i}"/weekly/

   FILES=(/pool/BACKUP/"${i}"/backup.week*.bz2.done); if [ -e "${FILES[0]}" ] ; then

   FILES=(/pool/BACKUP/"${i}"/backup.week*.bz2); if [ ! -e "${FILES[0]}" ] ; then

    rm -f /pool/BACKUP/"${i}"/backup.week*.bz2.done
fi
fi
fi

FILES=(/pool/BACKUP/"${i}"/backup.month*.bz2.done); if [ -e "${FILES[0]}" ] ; then

 mv -v /pool/BACKUP/"${i}"/backup.month*.bz2  /pool/BACKUP/"${i}"/monthly/

  FILES=(/pool/BACKUP/"${i}"/backup.month*.bz2.done); if [ -e "${FILES[0]}" ] ; then

  FILES=(/pool/BACKUP/"${i}"/backup.month*.bz2); if [ ! -e "${FILES[0]}" ] ; then

    rm -f /pool/BACKUP/"${i}"/backup.month*.bz2.done
fi
fi
fi
FILES=(/pool/BACKUP/"${i}"/backup.eq*.bz2.done); if [ -e "${FILES[0]}" ] ; then

 mv -v /pool/BACKUP/"${i}"/backup.eq*.bz2  /pool/BACKUP/"${i}"/daily/

  FILES=(/pool/BACKUP/"${i}"/backup.eq*.bz2.done); if [ -e "${FILES[0]}" ] ; then

  FILES=(/pool/BACKUP/"${i}"/backup.eq*.bz2); if [ ! -e "${FILES[0]}" ] ; then

    rm -f /pool/BACKUP/"${i}"/backup.eq*.bz2.done
fi
fi
fi
FILES=(/pool/BACKUP/"${i}"/mysql_backup*.bz2.done); if [ -e "${FILES[0]}" ] ; then

 mv -v /pool/BACKUP/"${i}"/mysql_backup*.bz2  /pool/BACKUP/"${i}"/daily/

   FILES=(/pool/BACKUP/"${i}"/mysql_backup*.bz2.done); if [ -e "${FILES[0]}" ] ; then

     FILES=(/pool/BACKUP/"${i}"/mysql_backup**.bz2); if [ ! -e "${FILES[0]}" ] ; then

         rm -f /pool/BACKUP/"${i}"/mysql_backup**.bz2.done
 fi
 fi
 fi
done
fi
FILES=(/pool/BACKUP/*/backup.*.bz2.done); if [ -e "${FILES[0]}" ] ; then
 email
 exit 1
 FILES=(/pool/BACKUP/*/backup.*.bz2); if [ -e "${FILES[0]}" ] ; then
 email
 exit 2
fi
 fi
exit 0
