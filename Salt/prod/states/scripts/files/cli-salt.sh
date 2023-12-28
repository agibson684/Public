#!/bin/bash 

set -x 
function check_salt_one_high {
#salt-run fileserver.update ; salt-run git_pillar.update wait=true; salt  "$1" saltutil.refresh_pillar;  salt "$1" state.highstate -t 10  
cd /srv/Salt; git pull origin; salt  "$1" saltutil.refresh_pillar;  salt "$1" state.highstate -t 10  

}

function check_salt_all_high {
#salt-run fileserver.update ; salt-run git_pillar.update wait=true; salt '*' saltutil.refresh_pillar;  salt '*' state.highstate -t 10 -b 1  
cd /srv/Salt; git pull origin; salt '*' saltutil.refresh_pillar;  salt '*' state.highstate -t 10 -b 1  

}

function check_salt_all_one {
#salt-run fileserver.update ; salt-run git_pillar.update wait=true; salt '*' saltutil.refresh_pillar;  salt '*' state.apply "$1" -t 10 -b 1  
cd /srv/Salt; git pull origin; salt '*' saltutil.refresh_pillar;  salt '*' state.apply "$1" -t 10 -b 1  

}

function check_salt_one_one {
#salt-run fileserver.update ; salt-run git_pillar.update wait=true; salt "$1" saltutil.refresh_pillar;  salt "$1" state.apply "$2" -t 10  
cd /srv/Salt; git pull origin;  salt "$1" saltutil.refresh_pillar;  salt "$1" state.apply "$2" -t 10  

}

function check_salt_cmd {
	 salt "$1" cmd.run "$2" -t 10 -b 1  
}

function check_salt_grain {
         salt '*' grains.item "$1" -t 10 -b 1  
}

function check_salt_local_high {
salt-call saltutil.refresh_pillar --local;  salt-call state.highstate  --local
}

function check_salt_local_one {
salt-call saltutil.refresh_pillar --local; salt-call state.apply "$1" --local
}

case "$1" in
{%- if 'laptop' in salt['grains.get']('roles') %} 
"" ) 
    check_salt_local_high 
    exit $?
  ;;
{% else %}
  "") 
    check_salt_all_high 
    exit $?   
  ;; 
{% endif %}
  "check")
    check_salt_one_high $2
    exit $?
  ;;
  "apply")
    check_salt_one_one $2 $3
    exit $?
  ;;
  "apply_all")
    check_salt_all_one  $2
    exit $?
  ;;
  "cmd")
    check_salt_cmd  $2 $3
    exit $?
  ;;
  "grain")
    check_salt_grain $2
    exit $?
  ;;
  "local_one")
   check_salt_local_one $2
    exit $?
  ;;
  "local_high")
   check_salt_local_high
    exit $?
  ;;
   "help")
   echo "check,apply,apply_all,cmd,grain,local_one,local_high" 
    exit $?
  ;;
  *)
  echo "i dont know what you want"
 esac

