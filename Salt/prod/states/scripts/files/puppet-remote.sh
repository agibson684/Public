#!/bin/bash
function debug {
set -x
puppet_apply_site="puppet apply --modulepath=/etc/puppet/modules site.pp --logdest console"
}
trap "bashtrap" EXIT
        bashtrap ()
        {
         puppet_summary_pid=`cat /var/run/puppet_summary.pid`
         if [[  "$$" -ne  "$puppet_summary_pid" ]] ; then
          echo 'script running'
           exit 1
         fi 
          rm -f /var/run/puppet_summary.pid
        exit 0
        }
 renice 10 $$
 ionice -c3 -p$$
 puppet_summary_pid=`cat /var/run/puppet_summary.pid`
 if [[ ! -z  "$puppet_summary_pid" ]] ; then
  if [[  "$$" -ne  "$puppet_summary_pid" ]] ; then
         echo 'script running'
           exit 1
  fi
 fi
 echo $$ > /var/run/puppet_summary.pid
 orig_summary=/var/cache/puppet/state/last_run_summary.yaml
 new_summary=/root/last_run_summary.yaml
 puppet_apply_site="puppet apply --modulepath=/etc/puppet/modules site.pp --logdest syslog"
 function pull_apply_puppet {
 echo "checking out puppet $branch repo and applying"
 echo 'please make sure your other repos are merged to master before applying'
 cd /etc/puppet/manifests/ && git checkout $branch && git pull origin $branch && $puppet_apply_site
 cd /etc/puppet/manifests/ && git checkout $branch && git pull origin-remote $branch && $puppet_apply_site
 cp -fv $orig_summary $new_summary
 }
 function default_master {
  branch=master
  pull_apply_puppet
 }
 function experimental  {
  branch=experimental
  pull_apply_puppet
 }
 if [ "$1" = '' ]; then
    default_master
 fi
 if [ "$1" = '-debug' ]; then
 echo 'set debug mode in second parameter'
 exit 1
 fi
 if [ "$1" = '--debug' ]; then
 echo 'set debug mode in second parameter'
 exit 1
 fi
 if [ "$2" = '-debug' ]; then
 echo 'set debug mode '
 debug
 fi
 if [ "$2" = '--debug' ]; then
 echo 'set debug mode '
 debug
 fi
 if [ "$1" = default_master ]; then 
       default_master
 fi
 if [ "$1" = experimental ]; then 
	experimental
 fi
 if [ "$1" = '--help' ]; then 
  echo 'please use the following commands'
  echo  'default_master pulls the default maser branch from origin repo and does a puppet apply on the server.'
  echo  'experimental pulls the experimental branch from origin repo and does a puppet apply on the server'
  echo 'debug will turn on debuging mode'
  exit 0
 fi
 if [ "$1" = '-help' ]; then 
 echo   'please use the following commands'
  echo  'default_master pulls the default maser branch from origin repo and does a puppet apply on the server.'
  echo  'experimental pulls the experimental branch from origin repo and does a puppet apply on the server' 
  echo  'debug will turn on debuging mode'
  exit 0
 fi
if [ $? ==  0 ] ;  then
 exit 0
 else
 exit 1
 fi

