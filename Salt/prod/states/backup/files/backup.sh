#!/bin/bash 
#this file is being managed by salt please do not edit!
# It will be over written every 120 minutes!
set -x 
date
ionice -c3 -p$$
renice 10 $$
exclude=/opt/scripts/{{ config.exclude }}
backup={{ config.backup }}
log={{ config.log }}
folders=({% for myfolders in config.folders -%}
       {{ config.folders_games }}/{{ myfolders+" "}} 
       {%- endfor %})
logerror={{ config.logerror  }}
isactivebackup="$(systemctl is-active media-backup.mount)"
isactivewindows="$(systemctl is-active mnt-windows.mount)"
maxsize=4000000
tarcmd() {
	time /bin/tar -cjvf "$backup" --ignore-failed-read -X "$exclude"  "${folders[@]}" 1>> "$log" 2>> "$logerror"
code="$?"
}
debugtarcmd() {
	time /bin/tar -cjvf "$backup" --ignore-failed-read -X "$exclude"  "${folders[@]}" 
code="$?"
}
email() {
                { echo  ' ' > /tmp/Error.tmp;}
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
                --form-string "token={{ salt['config.get']('pushtoken') }}" \
                --form-string "user={{ salt['config.get']('pushuser') }}" \
                --form-string "message=$(cat /tmp/Error.tmp)" \
                https://api.pushover.net/1/messages.json
                { echo 'Error Broken Backup';}
                { echo 'Error Broken Backup' >> "$logerror";}
		rm -f /tmp/errorcode.tmp  /tmp/Error.tmp
}
trap "bashtrap" TERM INT
        bashtrap ()
        {
		{ echo  ' ' > /tmp/Error.tmp;}
                { echo "$code" >>/tmp/errorcode.tmp;}
                { echo "$code" >>/tmp/Error.tmp;} 
                { echo >> /tmp/Error.tmp;}
                { echo >> /tmp/Error.tmp;}
                { echo >> /tmp/Error.tmp;}
                { echo  "${folders[@]}"   >> /tmp/Error.tmp;}
                { echo  "$log"            >> /tmp/Error.tmp;}
                { echo  "$backup"         >> /tmp/Error.tmp;}
		{ cat /tmp/errorcode.tmp  >> /tmp/Error.tmp;}
                { echo 'Broken Backup due to termination or interrupt!' >> /tmp/Error.tmp;}
		 curl -s \
                --form-string "token={{ salt['config.get']('pushtoken') }}" \
                --form-string "user={{ salt['config.get']('pushuser') }}" \
                --form-string "message=$(cat /tmp/Error.tmp)" \
                https://api.pushover.net/1/messages.json
                { echo 'Error Broken Backup';}
                { echo 'Error Broken Backup' >> "$logerror";}
                 echo "$code"
		  rm -f /tmp/errorcode.tmp  /tmp/Error.tmp
                 exit 1
                }
trap "bashexit" EXIT
bashexit ()
        {
          rm -f /var/run/backup.pid
                exit 0
        }
backup_pid=$(cat /var/run/backup.pid)
#if mkdir /var/run/backup-running-local;  then
if [[  -n  "$backup_pid" ]] ; then
    echo 'script running'
    email
   exit 1
else
echo $$ > /var/run/backup.pid
fi

function debug {
set -x
}
echo "$backup" "$exclude" "${folders[@]}"  "$log" "$logerror"
 function check_backup_mount {
 systemctl start media-backup.mount 1>> "$log" 2>> "$logerror"
        sleep 5
        if [ "$isactivebackup" = "inactive" ];  then
                { echo "$code" >> "$logerror";}
                email
                exit
        fi
 }
{% if config.function_check_windows_mount  == 'true' %}
 function check_windows_mount {
  systemctl start mnt-windows.mount 1>> "$log" 2>> "$logerror"
         sleep 5
         if [ "$isactivewindows" = "inactive" ];  then
                 { echo "$code" >> "$logerror";}
                 email
                 exit
        fi
 }
{% endif %}



if [ "$1" = '-no_backup_mount' ]; then
  {% if config.function_check_windows_mount == 'true' %}
    check_windows_mount 
  {% endif %}
debugtarcmd  
#time /bin/tar -cjvf "$backup" --ignore-failed-read -X "$exclude"  "${folders[@]}" 1>> "$log" 2>> "$logerror"
date
fi
if [ "$1" = '--no_backup_mount' ]; then
  {% if config.function_check_windows_mount == 'true' %}
    check_windows_mount 
  {% endif %}
debugtarcmd  
#time /bin/tar -cjvf "$backup" --ignore-failed-read -X "$exclude"  "${folders[@]}" 1>> "$log" 2>> "$logerror"
date
fi
if [ "$1" =  '' ]; then
  {% if config.function_check_windows_mount == 'true' %}
    check_windows_mount 
  {% endif %}
debugtarcmd  
#time /bin/tar -cjvf "$backup" --ignore-failed-read -X "$exclude"  "${folders[@]}" 1>> "$log" 2>> "$logerror"
date
fi
file_size_kb=$(du -k "$backup" | cut -f1)
	if [[ "$file_size_kb" -ge "$maxsize" ]]; then
		{ echo "$code" >> "$logerror";}
		{ echo 'backup is too large!' >> "$logerror";}
                { echo 'backup is too large!';}
                { echo "removing backup $backup" >> "$logerror";}
                { echo "removing backup $backup";}
		rm -fv "$backup" "$backup".done
		email
                fi
	if [[ "$code" -eq 0 ]];  then
		touch "$backup".done
		{ echo "$code" >> "$logerror";}
		exit
	elif [[ "$code" -eq 1 ]]; then
		{ echo "$code" >> "$logerror";}
                rm -f /var/run/backup.pid 
		exit 1
	else
		{ echo "removing backup $backup" >> "$logerror";}
                { echo "removing backup $backup";}
		rm -fv "$backup"
		email
		fi

