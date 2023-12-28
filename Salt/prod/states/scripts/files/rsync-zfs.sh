#!/bin/bash 
mountpoint /pool/MOVIES
 if [ $? ==  0 ] ;  then 
rsync -avz  /media/files_movies/  /pool/MOVIES/
fi
mountpoint /pool/TV_SHOWS
 if [ $? ==  0 ] ;  then 
rsync -avz  /media/tv/  /pool/TV_SHOWS/
fi
mountpoint /pool/MUSIC
 if [ $? ==  0 ] ;  then 
rsync -avz  /media/files_music/ /pool/MUSIC/
fi
mountpoint /pool/APPS 
 if [ $? ==  0 ] ;  then 
rsync -avz  /media/files_apps/ /pool/APPS/
fi
mountpoint /pool/MISC 
 if [ $? ==  0 ] ;  then 
rsync -avz  /media/misc/ /pool/MISC/
fi
mountpoint /pool/MISC 
 if [ $? ==  0 ] ;  then 
rsync -avz  /media/files_misc/ /pool/MISC/
fi

mountpoint /pool/BACKUP 
 if [ $? ==  0 ] ;  then 
rsync -avz  /media/Backup/ /pool/BACKUP/
fi
