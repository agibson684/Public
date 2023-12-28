#!/bin/bash 
set -x
#find all the mp4 files and check if they got a .mp3 file if not convert to mp3 with mencoder 
#check if it is null as well 
 arr=("$1")
  for x in "${arr[@]}"; do
    if [ ! -e "$x.mp3" ] ; then 
       mencoder  "$x" -of rawaudio -oac mp3lame -ovc copy   -lavdopts threads=3  -o  "${x%."$2"}.mp3"
    fi
done
exit

