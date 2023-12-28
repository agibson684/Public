#!/bin/bash 
#this file is being managed by salt please do not edit!
# It will be over written every 120 minutes!
date
ionice -c3 -p$$
renice 10 $$
wrappername={{ config.wrappername }}
  commands() {
    {{ config.command }}
    }
log={{ config.log }}
logerror={{ config.logerror  }}
email() {
                { echo  'To:  agibson684@gmail.com' > /tmp/Error.tmp;}
                { echo 'From: agibson684@gmail.com'  >> /tmp/Error.tmp;}
                { echo 'Subject: Error! Cron Failure!'  >> /tmp/Error.tmp;}
                { echo "$code" >>/tmp/Errorcode.tmp;}
                { echo "$code" >>/tmp/Error.tmp;}  
                { echo >> /tmp/Error.tmp;}
                { echo >> /tmp/Error.tmp;}
                { echo >> /tmp/Error.tmp;}
                { echo  "$wrappername"        >> /tmp/Error.tmp;}
                { echo  "$log"            >> /tmp/Error.tmp;}
                { echo  "$commands"         >> /tmp/Error.tmp;}
                { echo 'Broken Cron  due to none zero exit code!' >> /tmp/Error.tmp;}
                { cat /tmp/Errorcode.tmp  >> /tmp/Error.tmp;}
                curl -s \
		--form-string "token={{ salt['pillar.get']('pushtoken') }}" \
		--form-string "user={{ salt['pillar.get']('pushuser') }}" \
		--form-string "message=$(cat /tmp/Error.tmp)" \
		--form-string "priority=-2"
                https://api.pushover.net/1/messages.json
               # /usr/bin/msmtp --auto-from=off --from=agibson684@gmail.com --maildomain=thrace-lan.info -v agibson684@gmail.com < /tmp/Error.tmp
                { echo 'Error Broken Cron';}
                { echo 'Error Broken Cron' >> "$logerror";}
		rm -f /tmp/Error.tmp /tmp/Errorcode.tmp
}
trap "bashtrap" TERM INT
        bashtrap ()
        {
		{ echo  'To:  agibson684@gmail.com' > /tmp/Error.tmp;}
                { echo 'From: agibson684@gmail.com'  >> /tmp/Error.tmp;}
                { echo 'Subject: Error! Cron Failure!'  >> /tmp/Error.tmp;}
                { echo "$code" >>/tmp/Errorcode.tmp;}
                { echo "$code" >>/tmp/Error.tmp;} 
                { echo >> /tmp/Error.tmp;}
                { echo >> /tmp/Error.tmp;}
                { echo >> /tmp/Error.tmp;}
                { echo  "$wrappername"   >> /tmp/Error.tmp;}
                { echo  "$log"            >> /tmp/Error.tmp;}
                { echo  "$commands"         >> /tmp/Error.tmp;}
		{ cat /tmp/Errorcode.tmp  >> /tmp/Error.tmp;}
                { echo 'Broken Cron due to termination or interrupt!' >> /tmp/Error.tmp;}
		 curl -s \
		 --form-string "token={{ salt['pillar.get']('pushtoken') }}"} \
		 --form-string "user={{ salt['pillar.get']('pushuser') }}" \
                 --form-string "message=$(cat /tmp/Error.tmp)" \
	         --form-string "priority=-2"
	         https://api.pushover.net/1/messages.json
                { echo 'Error Broken Cron';}
                { echo 'Error Broken Cron' >> "$logerror";}
                 echo "$code"
		 rm -f /tmp/Error.tmp /tmp/Errorcode.tmp
                 exit 1
                }
trap "bashexit" EXIT
bashexit ()
        {
          rm -f /var/run/wrapper/"$wrappername".pid
        exit 0
        }
Cron_pid=$(cat /var/run/wrapper/$wrappername.pid)
if [[ ! -z  "$Cron_pid" ]] ; then
 if [[  "$$" -ne  "$Cron_pid" ]] ; then
        echo 'script running'
          email
          exit 1
 fi
fi
function debug {
set -x
}
echo "$wrappername" "$exclude" "${folders[@]}"  "$log" "$logerror"
echo $$ > /var/run/wrapper/"$wrappername.pid"
time commands  1>> "$log" 2>> "$logerror"
 code="$?"
 date
	if [[ "$code" -eq 0 ]] ;  then
		{ echo "$code" >> "$logerror";}
		exit
	else
		{ echo "removing Cron $wrappername" >> "$logerror";}
                { echo "removing Cron $wrappername";}
		rm -fv "/var/run/wrapper/$wrappername.pid"
		email
		fi

