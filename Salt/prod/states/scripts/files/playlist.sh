#!/bin/bash
#target=/mnt/disk/
array_source_name=( "$@" )
filelist=/var/tmp/filelist.txt
pwd="$PWD"
echo $target
echo 'finding the shows for playlist'
rm -f  $filelist
  for i in "${array_source_name[@]}";do
find  "${i[@]}"  -type f -iname "*.mpg" -exec realpath '{}' \; >> $filelist
find  "${i[@]}"  -type f -iname "*.mpeg" -exec realpath '{}' \; >> $filelist
find  "${i[@]}"  -type f -iname "*.mp4" -exec realpath '{}' \; >> $filelist
find  "${i[@]}"  -type f -iname "*.avi" -exec realpath '{}' \; >> $filelist
find  "${i[@]}"  -type f -iname "*.mkv" -exec realpath '{}' \; >> $filelist
find  "${i[@]}"  -type f -iname "*.mov" -exec realpath '{}' \; >> $filelist
find  "${i[@]}"  -type f -iname "*.wmv" -exec realpath '{}' \; >> $filelist
find  "${i[@]}"  -type f -iname "*.flv"  -exec realpath '{}' \; >> $filelist
done
#nano $filelist
cd $pwd
mpv --volume=70 --playlist="$filelist" 
sleep 1
rm -f $filelist

