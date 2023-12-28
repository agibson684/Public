#!/bin/bash 
#testing now

set +x
if [ "$1" = '' ] ;  then
 exit 100
fi
case $2 in 
	salt) release_number=$(cat /home/THRACE/erin/Salt/release.txt); release_location=/home/THRACE/erin/Salt/release.txt  ;;
	puppet) release_number=$(cat /home/THRACE/erin/puppet/manifests/release.txt); release_location=/home/THRACE/erin/puppet/manifests/release.txt ;;
	*) exit 100 ;;
esac
release_number=$(perl -e "print $release_number+.0001")
 if [ $? ==  1 ] ;  then
  exit 1
 fi
 echo 'New release number'
 echo "$release_number"
 echo  'commiting any changes for now on experimental'
  sleep 10
 git commit -a -m "$1"
  if [ $? ==  1 ] ;  then
  exit 1
 fi
 echo 'checking out experimental'
#  sleep 10
 git checkout  experimental
 if [ $? ==  1 ] ;  then
  exit 1
 fi
#  sleep 10
 git flow release start "$release_number"
 if [ $? ==  1 ] ;  then
  exit 1
 fi
#  sleep 10
 echo "$release_number"  > $release_location
 if [ $? ==  1 ] ;  then
  exit 1
 fi
#  sleep 10
 echo 'bumped the release number now'
 echo 'commiting changes'
 git commit -a -m "$1"
 if [ $? ==  1 ] ;  then
  exit 1
 fi
#  sleep 10
 echo 'finishing the release now'
 git flow release finish "$release_number" -m "$1"
 if [ $? ==  1 ] ;  then
  exit 1
 fi
# echo 'checking out experimental again'
# git checkout experimental
# if [ $? ==  1 ] ;  then
#  exit 1
# fi
# echo 'merging in develop to experimental again'
# git merge --no-ff -m "$1" develop 
# if [ $? ==  1 ] ;  then
#  exit 1
# fi
# echo 'Diffing the support and master if you see anything it didnt work'
# git diff experimental  master
# if [ $? ==  1 ] ;  then
#  exit 1
# fi
# sleep 10
 echo 'Diffing the master and experimental if you see anything it didnt work'
 git diff experimental master
 if [ $? ==  1 ] ;  then
  exit 1
 fi
# sleep 10
 echo 'doing a git push to all remote repos including tinylan'
 git push --all  --verbose --repo=origin
 git push --all  --verbose --repo=origin-remote
 git push --all  --verbose --repo=tinylan
 if [ $? ==  1 ] ;  then
  exit 1
 fi

