#!/bin/bash 
# Set the tvshow dir
TV_SHOWS=(/pool/TV_SHOWS/*)
#Set the season to start with
SEASON=1
for i in "${TV_SHOWS[@]}"
          do
 while [  $SEASON -lt 10 ]; do
   # I update the arr with [Ss] so that it will capsure the S01 and s01 files, 
   #as the caps is now being removed
   arr=("$i"/*[Ss]0"$SEASON"*)
    for x in "${arr[@]}"; do
    #if $x exsists
    if  [ -e "$x" ]; then 
    #make dir for seasons and move those files into it with no colobber set
     mkdir "$i/Season_0$SEASON" 2> /dev/null 
     mv -vn "$x"  "$i/Season_0$SEASON" 
    fi
    done
    let SEASON=SEASON+01
 done
 SEASON=1
done
SEASON=10
for i in "${TV_SHOWS[@]}"
          do
 while [  $SEASON -lt 101 ]; do
   arr=("$i"/*[Ss]"$SEASON"*)
    for x in "${arr[@]}"; do
     if  [ -e "$x" ]; then 
     mkdir "$i/Season_$SEASON" 2> /dev/null 
     mv -vn "$x"  "$i/Season_$SEASON" 
     fi
     done
    let SEASON=SEASON+01
 done
 SEASON=10
done



