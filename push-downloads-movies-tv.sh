#!/bin/bash
trap "bashtrap" EXIT
        bashtrap ()
        {
         push_pid=`cat /var/run/push.pid`
         if [[  "$$" -ne  "$push_pid" ]] ; then
          echo 'script running'
           exit 1
         fi 
          rm -f /var/run/push.pid
        exit 0
        }
renice 10 $$
ionice -c3 -p$$
push_pid=`cat /var/run/push.pid`
if [[ ! -z  "$push_pid" ]] ; then
 if [[  "$$" -ne  "$push_pid" ]] ; then
        echo 'script running'
          exit 1
 fi
fi
echo $$ > /var/run/push.pid
incomplete=/pool/DOWNLOADS
complete=/pool/COMPLETE
destination=/pool/TV_SHOWS
movies_dir=/pool/MOVIES
music_dir=/pool/MUSIC/
misc_dir=/pool/MISC/
app_dir=/pool/APPS/


function debug {
set -x
}

function move_tv_shows {
 if [  -e  "${FILES[0]}" ] ; then
  mv -v  "${FILES[@]}"  "$destination/${array_destination_name[$i]}/" 
   if [ $? ==  1 ] ;  then
     echo "attempting to move  ${FILES[@]} to  $destination/${array_destination_name[$i]} failed"
     echo 'trying to rsync them now'
     rsync --remove-source-files -avc "${FILES[@]}" "$destination/${array_destination_name[$i]}/" && rmdir "${FILES[@]}"
   fi
 fi
}



function  push_movies_tv {
#syncing up with the  seedbox
#checking to see if there are any incomplete files in downloads dir
#if not then move the files there to the next dir COMPLETE
FILES=($incomplete/*.part.*); if [ ! -e  "${FILES[0]}" ] ; then 
FILES=($incomplete/*.part); if [ ! -e  "${FILES[0]}" ] ; then 
 FILES=($incomplete/*/*.part); if [ ! -e  "${FILES[0]}" ] ; then 
  FILES=($incomplete/*/*/*.part); if [ ! -e  "${FILES[0]}" ] ; then 
  FILES=($incomplete/*/*/*/*.part); if [ ! -e  "${FILES[0]}" ] ; then
   DOWNLOADS=("$incomplete"/*); if [  -e  "${DOWNLOADS[0]}" ] ; then 
   for i in "${DOWNLOADS[@]}";do
   mv -v "${i}" /pool/COMPLETE/
  if [ $? ==  1 ] ;  then
           echo "attempting to move "${i[@]}" to "/pool/COMPLETE/""
            echo 'trying to rsync them now'
            rsync --remove-source-files -avc   "${i[@]}" "/pool/COMPLETE/" && rmdir "${i[@]}"
           fi
   done
   fi
  fi
 fi
fi
fi
fi
#checks for part files in complete in case it somehow got there.
#then it works the array to  move the files  to the proper destination
FILES=($complete/*.part); if [ ! -e  "${FILES[0]}" ] ; then 
 FILES=($complete/*/*.part); if [ ! -e  "${FILES[0]}" ] ; then 
  FILES=($complete/*/*/*.part); if [ ! -e  "${FILES[0]}" ] ; then 
    array_source_name=(
      "tvshow1"
      "tvshow2"
      )
      array_destination_name=(
      "tvshow1"
      "tvsho2"
      )
         #moving files to destinations now, checking if file is there or not
         i=0
         #((i++)); #echo $i ${array_destination_name[$i]}
         FILES=("$complete"/*My*TVSHOW1*)
         move_tv_shows
         ((i++)); #echo $i ${array_destination_name[$i]}
          #echo $i ${array_destination_name[$i]}
         FILES=("$complete"/*Mytvshow*)
          move_tv_shows
         FILES=("$complete"/*Same*Show*named*Different*)
         move_tv_shows
         ((i++)); #echo $i ${array_destination_name[$i]}
	 FILES=("$complete"/*This*is*another*show*)
	move_tv_shows



fi
 fi
  fi
}
     #this  function will go through the files in complete to move stuff i dont got checks for, wont normally run this way

      function sync_seedbox {
        echo 'syncing up with the  seedbox'
          rsync -avz -e "ssh -o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null -i \"$HOME/.ssh/privatekey_ssh\"  -p 123456 " --exclude '*.part' --progress username_seed_box@my_ip_here:/home/username_seed_box/torrents/data/  /pool/DOWNLOADS/

      }

      function push_complete {
         downloads=("$complete"/*)
         for i in "${downloads[@]}";do
         echo "${i}"
         echo "Is this a \(movie\) or \(tv\) show?"
         echo "Is this \(music\)?"
         echo "Is this \(misc\)?"
         echo "Is this an \(app\)?"
         echo "If you don't want to move it then say no"
         read -r response
         case "$response" in
         "movie" )
         mv -v "${i}"  "$movies_dir"
         ;;
         "tv" )
         mv -v "${i}" "$destination"
         ;;
         "music" )
         mv -v "${i}" "$music_dir"
         ;;
         "misc" )
         mv -v "${i}" "$misc_dir"
         ;;
         "app" )
         mv -v "${i}" "$app_dir"
         ;;
         "no" )
         ;;
         esac
         done
      }
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
 if [ "$1" = push_complete ]; then 
   push_complete
 fi
 if [ "$1" = sync_seedbox ]; then 
   sync_seedbox
 fi
 if [ "$1" = push_movies_tv ]; then 
  push_movies_tv
 fi
 if [ "$1" = '--help' ]; then 
  echo 'please use the following commands'
  echo  'push_complete this moves all the files and steps through what you want to do with each one.'
  echo  'sync_seedbox this copies the files from the seedbox to the server'
  echo  'push_movies_tv this is the normal operations with out an option, it moves the files to the proper dir for tv shows, and leaves movies alone.'
  echo 'debug will turn on debuging mode'
  exit 0
 fi
 if [ "$1" = '-help' ]; then 
  echo 'please use the following commands'
  echo  'push_complete this moves all the files and steps through what you want to do with each one.'
  echo  'sync_seedbox this copies the files from the seedbox to the server'
  echo  'push_movies_tv this is the normal operations with out an option, it moves the files to the proper dir for tvshows, and leaves movies alone.'
  echo 'debug will turn on debuging mode'
  exit 0
 fi
 if [ "$1" = '' ]; then 
  push_movies_tv
 fi

if [ $? ==  0 ] ;  then
 exit 0
 else
 exit 1
 fi



