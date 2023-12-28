#!/bin/bash 
#testing still again
set +x
if [ "$1" = '' ] ;  then
 exit 100
fi
echo  'commiting any changes for now '
 git commit -a -m "$1"
  if [ $? ==  1 ] ;  then
  exit 1
 fi
  if [ "$1" ==  "-s" ] ;  then
  git flow feature start "$2"
 fi
 if [ $? ==  1 ] ;  then
  exit 1
 fi
  if [ "$1" ==  "-f" ] ;  then
  git flow feature finish "$2"
  push
 fi
 if [ $? ==  1 ] ;  then
  exit 1
 fi
 if [ "$1" ==  "-l" ] ;  then
  git flow feature list
 fi
function push {
 sleep 10
 echo 'doing a git push to all remote repos including tinylan'
 git push --all  --verbose --repo=origin
 git push --all  --verbose --repo=origin-remote
 git push --all  --verbose --repo=tinylan
 if [ $? ==  1 ] ;  then
  exit 1
 fi
}
