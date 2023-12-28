#!/bin/bash 
#this file is being managed by salt please do not edit!
# It will be over written every 120 minutes!
function debug {
set -x
}
debug
date
ionice -c3 -p$$
renice 10 $$
bksource='{{ config.bksource }}'
bkdest='{{ config.bkdest }}'
log='{{ config.log }}'
logerror='{{ config.logerror  }}'
params='{{ config.params }}'
commands='{{ config.commands }}'
keepdays='{{ config.keepdays }}'
export B2_ACCOUNT_INFO="$home/.b2_account_info"
#you need to run the command manually to put the b2_account_info sqllite db on your /root/

cmd() {
	time /opt/scripts/b2 "$commands" --threads "$params"  --keepDays "$keepdays" --replaceNewer  "$bksource" "$bkdest"  1>> "$log" 2>> "$logerror"
code="$?"
}
trap "bashtrap" TERM INT 
        bashtrap ()
        {
		{ echo  ' ' > /tmp/Error.tmp;}
                { echo "$code" >>/tmp/errorcode.tmp;}
                { echo "$code" >>/tmp/Error.tmp;} 
                { echo  "$params"        >> /tmp/Error.tmp;}
                { echo  "$log-error"            >> /tmp/Error.tmp;}
                { echo  "$bksource"            >> /tmp/Error.tmp;}
		{ echo  "$bkdest"            >> /tmp/Error.tmp;}
                { echo  "$commands"         >> /tmp/Error.tmp;}
                { echo  "$log"            >> /tmp/Error.tmp;}
		{ cat /tmp/errorcode.tmp  >> /tmp/Error.tmp;}
                { echo 'Broken Remove Backup due to termination or interrupt!' >> /tmp/Error.tmp;}
		 curl -s \
                --form-string "token={{ salt['config.get']('pushtoken') }}" \
                --form-string "user={{ salt['config.get']('pushuser') }}" \
                --form-string "message=$(cat /tmp/Error.tmp)" \
                https://api.pushover.net/1/messages.json
                { echo 'Error REMOTE Broken Backup';}
                { echo 'Error REMOTE Broken Backup' >> "$logerror";}
                 echo "$code"
		  rm -f /tmp/errorcode.tmp  /tmp/Error.tmp
                 exit 1
                }
      email ()
        {
		{ echo  ' ' > /tmp/Error.tmp;}
                { echo "$code" >>/tmp/errorcode.tmp;}
                { echo "$code" >>/tmp/Error.tmp;} 
                { echo  "$params"        >> /tmp/Error.tmp;}
                { echo  "$log-error"            >> /tmp/Error.tmp;}
                { echo  "$bksource"            >> /tmp/Error.tmp;}
		{ echo  "$bkdest"            >> /tmp/Error.tmp;}
                { echo  "$commands"         >> /tmp/Error.tmp;}
                { echo  "$log"            >> /tmp/Error.tmp;}
		{ cat /tmp/errorcode.tmp  >> /tmp/Error.tmp;}
                { echo 'Broken Remove Backup due to termination or interrupt!' >> /tmp/Error.tmp;}
		 curl -s \
                --form-string "token={{ salt['config.get']('pushtoken') }}" \
                --form-string "user={{ salt['config.get']('pushuser') }}" \
                --form-string "message=$(cat /tmp/Error.tmp)" \
                https://api.pushover.net/1/messages.json
                { echo 'Error REMOTE Broken Backup';}
                { echo 'Error REMOTE Broken Backup' >> "$logerror";}
                 echo "$code"
		  rm -f /tmp/errorcode.tmp  /tmp/Error.tmp
                 exit 1
                }



hours=0
until [ $hours -gt 12 ]
do
  if mkdir /var/run/backup-running > /dev/null 2>&1; then 
    echo "$bksource" "$bkdest" "$params" "$commands" "$log" "$logerror"
      date
      cmd 
      date
  if [[ "$code" -eq 0 ]] ; then
  #set to 144 if cmd succeded 
       hours=13
       rmdir /var/run/backup-running
       exit 
  elif [[ "$code" -ne 0 ]] ; then 
       hours=13
       rmdir /var/run/backup-running
       email       
  fi
  else 
  sleep 60m 
  fi
  ((hours++))
done 

	if [[ "$code" -eq 0 ]] ;  then
		{ echo "$code" >> "$logerror";}
	        rmdir /var/run/backup-running
 
		exit
	elif [[ "$code" -eq 1 ]] ; then		 
		{ echo "$code" >> "$logerror";}
	        rmdir /var/run/backup-running
		email
	else 
        	{ echo "$code" >> "$logerror";}
	        rmdir /var/run/backup-running
		email
	fi

