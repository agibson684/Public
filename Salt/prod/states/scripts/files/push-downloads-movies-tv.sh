#!/bin/bash
date
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
bittorrent=/pool/BITTORRENT/completed
incomplete=/pool/DOWNLOADS
complete=/pool/COMPLETE
destination=/pool/TV_SHOWS
movies_dir=/pool/MOVIES
music_dir=/pool/MUSIC/
misc_dir=/pool/MISC/
app_dir=/pool/APPS/
youtube_dir=/pool/TV_SHOWS/YouTube/
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
#syncing up with the seedkiller seedbox
#checking to see if there are any incomplete files in downloads dir
#if not then move the files there to the next dir COMPLETE
#this remote is checking if there are any part files on the server. if there are it will exit 1
#this is to prevent the script from pushing files and then downloading the same files if the torrents take longer then they should. 
#REMOTE_FILES=$(ssh eryn684@feathers.chmuranet.net -i "$HOME/.ssh/eryn684.Feathers.Chmuranet.net" find -iname *.part) 
REMOTE_FILES=$(find /media/downloads/ -iname *.part)
 for i in "${REMOTE_FILES[@]}"
          do
           echo "$i"
           if  [ -n "$REMOTE_FILES" ]; then 
           exit 1
          fi 
          done
#adding in bittorrent directory
REMOTE_FILES=("$bittorrent"/*)
 for i in "${REMOTE_FILES[@]}"
   do
     mv -v "${i}" /pool/COMPLETE/
       if [ $? ==  1 ] ;  then
         echo "attempting to move "${i[@]}" to "/pool/COMPLETE/""
         echo 'trying to rsync them now'
        rsync --remove-source-files -avc   "${i[@]}" "/pool/COMPLETE/" && rmdir "${i[@]}"
       fi
  done
 
	 
 FILES=("$incomplete"/*.part.*); if [ ! -e  "${FILES[0]}" ] ; then 
 FILES=("$incomplete"/*.part); if [ ! -e  "${FILES[0]}" ] ; then 
  FILES=("$incomplete"/*/*.part); if [ ! -e  "${FILES[0]}" ] ; then 
   FILES=("$incomplete"/*/*/*.part); if [ ! -e  "${FILES[0]}" ] ; then 
    FILES=("$incomplete"/*/*/*/*.part); if [ ! -e  "${FILES[0]}" ] ; then
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
   #Translate Caps to Small letters
    cd $complete && rename 'y/A-Z/a-z/' *
      array_destination_name=(
      'SuperGirl'
      'The Simpsons'
      'NCIS New Orleans'
      'Agents of shield'
      'Doctor Who Series'
      'Downton Abbey'
      'American Horror Story'
      "Nova Vita"
      "WestWorld"
      "Saturday Night Live"
      "The Flash"
      "Last Week Tonight With John Oliver"
      "VICE"
      'Canadas Drag Race'
      'Drag Race Espana'
      "RuPauls Drag Race UK"
      'RuPauls Drag Race Down Under'
      'RuPauls Drag Race All Stars'
      "60 Minutes"
      "Outlander"
      "Stranger Things"
      "Orville"
      "The Good Doctor"
      "The Alienist"
      "Castle Rock"
      "Grace And Frankie"
      "Titans"
      "Roswell"
      "Hanna"
      "Manifest"
      "American Gods"
      "Blindspot"
      "The Good Fight"
      "Halloween Baking"
      "Evil"
      "Star Trek Picard"
      "This Old House"
      "The Witcher"
      "Lincoln Rhyme - Hunt for the Bone Collector"
      "Graham Norton"
      "Jeopardy"
      "Cosmos Possible Worlds"
      "Top Gear"
      "American Pickers"
      "Battle Bots"
      "Killing Eve"
      "Motherland Fort Salem"
      "Forged in Fire"
      "NOS4A2"
      "Perry Mason"
      "Warrior Nun"
      "LoveCraft Country"
      "NeXt"
      'His Dark Materials'
      'NCIS Los Angeles'
      'NCIS'
      'Pennyworth'
      'The Undoing'
      'Trickster'
      'Young Sheldon'
      'Legacies'
      'Clarice'
      'RuPauls Drag Race'
      'Kung Fu 2021'
      'Miss Scarlet and The Duke'
      'Dragula'
      'Loki'
      'the Falcon and the Winter Soldier'
      'The Marvelous Mrs Maisel'
      'The Watch'       
      'Superman and Lois'
      'American Horror Stories'
      'SurrealEstate'
      'Foundation'
      'Slasher'
      'What We Do In The Shadows'
      'Dan Browns The Lost Symbol'
      'Nova'
      'Leverage Redemption'
      'CSI Vegas'
      '4400(2021)' 
      'Dexter New Blood'
      'Wheel Of Time'
      'Hawkeye'
      'Yellowstone'
      'Queen Of The Universe'
      '1883'
      'Station Eleven'
      'Peacemaker'
      'Batwoman'
      'The Girl In The Woods'
      'Nature'
      'Star Trek Strange New Worlds'
      'Moon Knight' 
      'Severance'
      'The Time Travelers Wife'
      'The Man Who Fell To Earth'
      'Dark Winds'
      'Americas Got Talent'
      'Only Murders'
      'She-Hulk Attorney at Law'
      'Quantum Leap (2022)'
      'Interview With The Vampire'
      'The Serpent Queen'
      'Ghosts 2021'
      'Chucky'
      'House of The Dragon'
      'The Cleaning Lady'
      'Hudson and Rex'
      'See'
      'My Life Is Murder'
      'The Peripheral'
      'Wednesday'
      '1899'
      'Pitch Perfect Bumper in Berlin'
      'Dead to Me'
      'Were Here'
      'Criminal Minds Evolution'
     )
     
         #moving files to destinations now, checking if file is there or not
         i=0
         #((i++)); #echo $i ${array_destination_name[$i]}
          #echo $i ${array_destination_name[$i]}
         FILES=("$complete"/*supergirl*)
        move_tv_shows
         ((i++)); #echo $i ${array_destination_name[$i]}
	 FILES=("$complete"/*the*simpsons*)
        move_tv_shows
         ((i++)); #echo $i ${array_destination_name[$i]}
	 FILES=("$complete"/*ncis*new*orleans*)
	move_tv_shows
        ((i++)); #echo $i ${array_destination_name[$i]}
	 FILES=("$complete"/*shield*)
	move_tv_shows
          #echo $i ${array_destination_name[$i]}
         FILES=("$complete"/*marvels?agents?of?s?h?i?e?l?d*)
	move_tv_shows
        ((i++)); #echo $i ${array_destination_name[$i]}
         FILES=("$complete"/*doctor*who*)
	move_tv_shows
         ((i++)); #echo $i ${array_destination_name[$i]}
         FILES=("$complete"/*downton*abbey*)
	move_tv_shows
         ((i++)); #echo $i ${array_destination_name[$i]}
         FILES=("$complete"/*american*horror*story*)
	move_tv_shows
         ((i++)); #echo $i ${array_destination_name[$i]}
         FILES=("$complete"/*nova*vita*)
	move_tv_shows
         ((i++)); #echo $i ${array_destination_name[$i]}
         FILES=("$complete"/*westworld*)
	move_tv_shows
         ((i++)); #echo $i ${array_destination_name[$i]}
         FILES=("$complete"/*saturday*night*live*)
	move_tv_shows
         ((i++)); #echo $i ${array_destination_name[$i]}
         FILES=("$complete"/*the*flash*)
	move_tv_shows
         ((i++)); #echo $i ${array_destination_name[$i]}
         FILES=("$complete"/*last*week*tonight*with*john*oliver*)
        move_tv_shows
        ((i++)); #echo $i ${array_destination_name[$i]}
         FILES=("$complete"/*vice*)
        move_tv_shows
        ((i++)); #echo $i ${array_destination_name[$i]}
         FILES=("$complete"/*canada*drag*race*)
         move_tv_shows
        ((i++)); #echo $i ${array_destination_name[$i]}
         FILES=("$complete"/*drag*race*espana*)
        move_tv_shows
        ((i++)); #echo $i ${array_destination_name[$i]}
         FILES=("$complete"/*rupauls*drag*race*uk*)
        move_tv_shows
       ((i++)); #echo $i ${array_destination_name[$i]}
         FILES=("$complete"/*rupauls*drag*down*under*)
        move_tv_shows
       ((i++)); #echo $i ${array_destination_name[$i]}
         FILES=("$complete"/*rupauls*drag*race*all*stars*)
        move_tv_shows
       ((i++)); #echo $i ${array_destination_name[$i]}
         FILES=("$complete"/*60*minutes*)
        move_tv_shows
        ((i++)); #echo $i ${array_destination_name[$i]}
         FILES=("$complete"/*outlander*)
        move_tv_shows
        ((i++)); #echo $i ${array_destination_name[$i]}
         FILES=("$complete"/*stranger*things*)
        move_tv_shows
        ((i++)); #echo $i ${array_destination_name[$i]}
         FILES=("$complete"/*orville*)
        move_tv_shows
        ((i++)); #echo $i ${array_destination_name[$i]}
         FILES=("$complete"/*the*good*doctor*)
        move_tv_shows
        ((i++)); #echo $i ${array_destination_name[$i]}
         FILES=("$complete"/*the*alienist*)
        move_tv_shows
        ((i++));  
         FILES=("$complete"/*castle*rock*)
        move_tv_shows
        ((i++)); #echo $i ${array_destination_name[$i]}
         FILES=("$complete"/*grace*and*frankie*)
        move_tv_shows
        ((i++)); #echo $i ${array_destination_name[$i]}
         FILES=("$complete"/*titans*)
        move_tv_shows
        ((i++)); #echo $i ${array_destination_name[$i]}
         FILES=("$complete"/*roswell*)
        move_tv_shows
         ((i++)); #echo $i ${array_destination_name[$i]}
         FILES=("$complete"/*hanna*)
        move_tv_shows
         ((i++)); #echo $i ${array_destination_name[$i]}
         FILES=("$complete"/*manifest*)
        move_tv_shows
         ((i++)); #echo $i ${array_destination_name[$i]}
         FILES=("$complete"/*american*gods*)
        move_tv_shows
         ((i++));
         FILES=("$complete"/*blindspot*)
        move_tv_shows
         ((i++));
         FILES=("$complete"/*the*good*fight*)
        move_tv_shows
       ((i++));
          FILES=("$complete"/*halloween*baking*)
        move_tv_shows
 	((i++));
          FILES=("$complete"/*evil*)
        move_tv_shows
       ((i++));
         FILES=("$complete"/*star*trek*picard*)
        move_tv_shows
	((i++));
          FILES=("$complete"/*this*old*house*)
        move_tv_shows
	((i++));
         FILES=("$complete"/*the*witcher*)
        move_tv_shows
	((i++));
          FILES=("$complete"/*lincoln*rhyme*hunt*for*the*bone*collector*)
        move_tv_shows
	((i++));
         FILES=("$complete"/*the*graham*norton*show*)
        move_tv_shows
       ((i++));
         FILES=("$complete"/*jeopardy*)
        move_tv_shows
        ((i++));
         FILES=("$complete"/*cosmos*)
        move_tv_shows
        ((i++));
         FILES=("$complete"/*top*gear*)
        move_tv_shows
        ((i++));
         FILES=("$complete"/*american*pickers*)
        move_tv_shows
        ((i++));
         FILES=("$complete"/*battle*bots*)
        move_tv_shows
        ((i++));
         FILES=("$complete"/*killing*eve*)
        move_tv_shows
        ((i++));
         FILES=("$complete"/*motherland*fort*salem*)
        move_tv_shows
        ((i++));
         FILES=("$complete"/*forged*in*fire*)
        move_tv_shows
	((i++));
         FILES=("$complete"/*nos4a2*)
         move_tv_shows
       ((i++));
         FILES=("$complete"/*perry*mason*)
         move_tv_shows
        ((i++));
         FILES=("$complete"/*warrior*nun*)
         move_tv_shows
       ((i++));
         FILES=("$complete"/*lovecraft*country*)
          move_tv_shows
        ((i++));
         FILES=("$complete"/*next*)
          move_tv_shows
	((i++));
         FILES=("$complete"/*His*Dark*Materials*)
 	  move_tv_shows
         FILES=("$complete"/*his*dark*materials*)
 	  move_tv_shows
	 FILES=("$complete"/*His*dark*Materials*)
 	  move_tv_shows
         FILES=("$complete"/*His*dark*materials*)
 	  move_tv_shows
 	((i++)); 
	 FILES=("$complete"/*NCIS*Los*Angeles*)
	  move_tv_shows
	 FILES=("$complete"/*ncis*Los*Angeles*)
	  move_tv_shows
	 FILES=("$complete"/*ncis*los*angeles*)
	  move_tv_shows
	((i++)); 
	 FILES=("$complete"/*ncis*)
	  move_tv_shows
	 FILES=("$complete"/*NCIS*)
	  move_tv_shows
	((i++)); 
	 FILES=("$complete"/*pennyworth*)
	  move_tv_shows
	((i++));
	 FILES=("$complete"/*the*undoing*)
	  move_tv_shows
	((i++));
	 FILES=("$complete"/*trickster*)
	  move_tv_shows
	((i++));
         FILES=("$complete"/*young*sheldon*)
	  move_tv_shows
	((i++));
         FILES=("$complete"/*legacies*)
	  move_tv_shows
	((i++));
         FILES=("$complete"/*clarice*)
	  move_tv_shows
	((i++));
         FILES=("$complete"/*drag*race*)
	  move_tv_shows
         FILES=("$complete"/*rupaul*)
	  move_tv_shows
	((i++));
         FILES=("$complete"/*kung*fu*)
	  move_tv_shows
	((i++));
         FILES=("$complete"/*miss*scarlet*and*the*duke*)
	  move_tv_shows
	((i++));
         FILES=("$complete"/*dragula*)
	  move_tv_shows
	((i++));
         FILES=("$complete"/*loki*)
	  move_tv_shows
	((i++));
         FILES=("$complete"/*the*falcon*and*the*winter*soldier*)
	  move_tv_shows
	((i++));
         FILES=("$complete"/*the*marvelous*mrs*maisel*)
	  move_tv_shows
	((i++));
         FILES=("$complete"/*the*watch*)
	  move_tv_shows
	((i++));
         FILES=("$complete"/*superman*and*lois*)
	  move_tv_shows
        ((i++));
         FILES=("$complete"/*american*horror*stories*)
	  move_tv_shows
        ((i++));
         FILES=("$complete"/*surrealestate*)
	  move_tv_shows
        ((i++));
         FILES=("$complete"/*foundation*)
	  move_tv_shows
        ((i++));
         FILES=("$complete"/*slasher*)
	  move_tv_shows
        ((i++));
         FILES=("$complete"/*what*we*do*in*shadows*)
	  move_tv_shows
        ((i++));
         FILES=("$complete"/*dan*browns*the*lost*symbol*)
	  move_tv_shows
        ((i++));
         FILES=("$complete"/*nova*)
	  move_tv_shows
        ((i++));
         FILES=("$complete"/*leverage*redemption*)
	  move_tv_shows
        ((i++));
         FILES=("$complete"/*csi*vegas*)
	  move_tv_shows
        ((i++));
         FILES=("$complete"/*4400*)
	  move_tv_shows
        ((i++));
         FILES=("$complete"/*dexter*)
	  move_tv_shows
        ((i++));
         FILES=("$complete"/*wheel*of*time*)
	  move_tv_shows
        ((i++));
         FILES=("$complete"/*hawkeye*)
	  move_tv_shows
        ((i++));
         FILES=("$complete"/*yellowstone*)
	  move_tv_shows
        ((i++));
         FILES=("$complete"/*queen*of*the*universe*)
	  move_tv_shows
        ((i++));
         FILES=("$complete"/*1883*)
	  move_tv_shows
        ((i++));
         FILES=("$complete"/*station*eleven*)
	  move_tv_shows
        ((i++));
         FILES=("$complete"/*peacemaker*)
	  move_tv_shows
       ((i++));
         FILES=("$complete"/*batwoman*)
	  move_tv_shows
       ((i++));
         FILES=("$complete"/*the*girl*in*the*woods*)
	  move_tv_shows
       ((i++));
         FILES=("$complete"/*nature*)
	  move_tv_shows
       ((i++));
         FILES=("$complete"/*star*trek*strange*new*worlds*)
	  move_tv_shows
       ((i++));
         FILES=("$complete"/*moon*knight*)
	  move_tv_shows
       ((i++));
         FILES=("$complete"/*severance*)
	  move_tv_shows
       ((i++));
         FILES=("$complete"/*the*time*travelers*wife*)
	  move_tv_shows
       ((i++));
         FILES=("$complete"/*the*man*who*fell*to*earth*)
	  move_tv_shows
       ((i++));
         FILES=("$complete"/*dark*winds*)
	  move_tv_shows
       ((i++));
         FILES=("$complete"/*americas*got*talent*)
	  move_tv_shows
      ((i++));
         FILES=("$complete"/*only*murders*in*the*building*)
	  move_tv_shows
      ((i++));
         FILES=("$complete"/*she-hulk*attorney*at*law*)
	  move_tv_shows
       ((i++));
         FILES=("$complete"/*quantum*leap*)
	  move_tv_shows
       ((i++));
         FILES=("$complete"/*interview*with*the*vampire*)
	  move_tv_shows
       ((i++));
         FILES=("$complete"/*the*serpent*queen*)
	  move_tv_shows
       ((i++));
         FILES=("$complete"/*ghosts*)
	  move_tv_shows
       ((i++));
         FILES=("$complete"/*chucky*)
	  move_tv_shows
       ((i++));
         FILES=("$complete"/*house*of*the*dragon*)
	  move_tv_shows
       ((i++));
         FILES=("$complete"/*the*cleaning*lady*)
	  move_tv_shows
       ((i++));
         FILES=("$complete"/*hudson*and*rex*)
	  move_tv_shows
       ((i++));
         FILES=("$complete"/*see*)
	  move_tv_shows
       ((i++));
         FILES=("$complete"/*my*life*is*murder*)
	  move_tv_shows
       ((i++));
         FILES=("$complete"/*the*peripheral*)
	  move_tv_shows
       ((i++));
         FILES=("$complete"/*wednesday*)
	  move_tv_shows
       ((i++));
         FILES=("$complete"/*1899*)
	  move_tv_shows
       ((i++));
         FILES=("$complete"/*pitch*perfect*bumper*in*berlin*)
	  move_tv_shows
       ((i++));
         FILES=("$complete"/*dead*to*me*)
	  move_tv_shows
       ((i++));
         FILES=("$complete"/*were*here*)
	  move_tv_shows
       ((i++));
         FILES=("$complete"/*criminal*minds*evolution*)
	  move_tv_shows


















fi
 fi
  fi
}
#This is the sync to seedbox funtion to pull files from the transmission seedbox
       #function copy_torrents { rsync -avz -e "ssh -o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null -i \"$HOME/.ssh/eryn684.Feathers.Chmuranet.net\" -p 22 " --exclude '*.part' --progress eryn684@feathers.chmuranet.net:/home/owner/Downloads/  /pool/DOWNLOADS/
          #}
        function sync_seedbox {
           echo 'syncing up with the seedbox'
	  #i put the seeding array up here to prevent a torrent completing while rsync is running long and then getting removed before it can be copied over, this way we already go a list of torrents that are completed before we start syncing
	  Seeding=$(/usr/bin/transmission-remote xena.thrace.lan:9091 --auth erin:password -l |  awk '/100%/ {print $1}')
          #Seeding=$(/usr/bin/transmission-remote feathers.chmuranet.net:9091 --auth eryn684:agibson684@gmail.com  -l |  awk '/100%/ {print $1}')
             #copy_torrents
               if [[ $? -gt  1 ]] ;  then
               echo $?
               echo "Trying to sync from seedbox failed"
               echo 'exiting'
               exit 1
               fi
          array=(echo $Seeding)
          for i in "${array[@]}"
           do
            echo "$i"
	    /usr/bin/transmission-remote xena.thrace.lan:9091 --auth erin:password -t "$i" --remove
           # /usr/bin/transmission-remote feathers.chmuranet.net:9091 --auth eryn684:agibson684@gmail.com -t "$i" --remove-and-delete
           done
         }

      function push_complete {
         downloads=("$complete"/*)
         for i in "${downloads[@]}";do
         clear
         echo "${i}"
         echo "Is this a \(movie\) or \(tv\) show?"
         echo "Is this \(music\)?"
         echo "Is this \(misc\)?"
         echo "Is this an \(app\)?"
         echo "Is this a \(youtube\) video?"
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
         "youtube" )
         mv -v "${i}" "$youtube_dir"
         ;;
         "no" )
         ;;
         esac
         done
      }
      function push_apps_pictures_documents {
      downloads=("$complete"/*)
      for i in "${downloads[@]}";
       do
        mv -v *.zip "$app_dir"
        mv -v *.jpg "$misc_dir"
        mv -v *.jpeg "$misc_dir"
        mv -v *.gif "$misc_dir"
        mv -v *.tiff "$misc_dir"
        mv -v *.pdf "$misc_dir"
        mv -v *.raw "$misc_dir"
        mv -v *.deb "$app_dir"
        mv -v *.exe "$app_dir"
        mv -v *.mp3 "$music_dir"
        mv -v *.ogg "$music_dir"
	mv -v *.tar "$app_dir"
       	mv -v *.gz "$app_dir"
       done
     }  
      case "$1" in 
        "-debug")
          echo 'set debug mode in second parameter'
          exit 1
        ;;
        "--debug")
         echo 'set debug mode in second parameter'
         exit 1
        ;;
        "push_complete")
	   push_complete	 
        ;;
        "sync_seedbox")
          sync_seedbox
	;;
        "push_movies_tv")
	  push_movies_tv
	;;
        "push_apps_pictures_documents")	
          push_apps_pictures_documents
	;;
        "--help")
          echo 'please use the following commands'
          echo  'push_complete this moves all the files and steps through what you want to do with each one.'
          echo  'sync_seedbox this copies the files from the seedbox to the server'
          echo  'push_movies_tv this is the normal operations with out an option, it moves the files to the proper dir for tv shows, and leaves movies alone.'
          echo  'push_apps_pictures_documents will push all the documents to the misc dir.'
          echo  'debug will turn on debuging mode'
          exit 0
        ;;
        "-help")
          echo 'please use the following commands'
          echo  'push_complete this moves all the files and steps through what you want to do with each one.'
          echo  'sync_seedbox this copies the files from the seedbox to the server'
          echo  'push_movies_tv this is the normal operations with out an option, it moves the files to the proper dir for tv shows, and leaves movies alone.'
          echo  'push_apps_pictures_documents will push all the documents to the misc dir.'
          echo  'debug will turn on debuging mode'
          exit 0
	;;  
	*)
	  push_movies_tv
	;;
      esac 

      case "$2" in 
        "-debug")	 
          echo 'set debug mode'
          debug
        ;; 
        "--debug")
          echo ' set debug mode'
          debug
       esac  
 
 
if [ $? ==  0 ] ;  then
date
 exit 0
 else
date
 exit 1
 fi



