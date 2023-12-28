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
)
     #moving files to destinations now, checking if file is there or not
         i=0     
         FILES=("$complete"/*supergirl*)
        move_tv_shows
         ((i++))
         FILES=("$complete"/*the*simpsons*)
        move_tv_shows
         ((i++))
         FILES=("$complete"/*ncis*new*orleans*)
        move_tv_shows
        ((i++))
         FILES=("$complete"/*shield*)
        move_tv_shows       
         FILES=("$complete"/*marvels?agents?of?s?h?i?e?l?d*)
        move_tv_shows
        ((i++))
         FILES=("$complete"/*doctor*who*)
        move_tv_shows
         ((i++))
         FILES=("$complete"/*downton*abbey*)
        move_tv_shows
         ((i++))
