#!/bin/bash
target=/mnt/disk/
array_source_name=('/pool/TV_SHOWS/' '/pool/MOVIES/' '/media/sync_movies' '/media/file_movies/' )
tv_shows=/pool/TV_SHOWS/
sync_seedbox="$( /opt/scripts/push-downloads-movies-tv.py sync_box)"
push="$( /opt/scripts/push-downloads-movies-tv.py main)"
sneakernet="/opt/scripts/clean-up-meta-sneakernet.sh"
nas="/opt/scripts/clean-up-meta-nas.sh"
sorts="/opt/scripts/sort-seasons.sh"
cleanup="/mnt/disk/scripts/clean_up_disk.sh"
days="$1"
filelist=/var/tmp/filelist.txt
mount /mnt/disk/ 
$sync_seedbox 
$push 
$nas
$sorts 
echo $target
  echo 'find all the new TV Shows'
  cat /dev/null > $filelist
  for i in "${array_source_name[@]}";do
find  "${i[@]}"  -type f -mtime -"$days" -iname "*.mpg" -exec ls '{}' \; >> $filelist
find  "${i[@]}"  -type f -mtime -"$days" -iname "*.mpeg" -exec ls '{}' \; >> $filelist
find  "${i[@]}"  -type f -mtime -"$days" -iname "*.mp4" -exec ls '{}' \; >> $filelist
find  "${i[@]}"  -type f -mtime -"$days" -iname "*.avi" -exec ls '{}' \; >> $filelist
find  "${i[@]}"  -type f -mtime -"$days" -iname "*.mkv" -exec ls '{}' \; >> $filelist
find  "${i[@]}"  -type f -mtime -"$days" -iname "*.mov" -exec ls '{}' \; >> $filelist
find  "${i[@]}"  -type f -mtime -"$days" -iname "*.wmv" -exec ls '{}' \; >> $filelist
find  "${i[@]}"  -type f -mtime -"$days" -iname "*.flv"  -exec ls '{}' \; >> $filelist
done
sleep 60
nano $filelist
echo "syncing up the $target"
sleep 60
rsync -rltzuvs --protect-args  --files-from="$filelist" / "$target"
  sed '/$/{G;}/'-i $filelist
  curl -s \
  --form-string "token={{ salt['pillar.get']('pushtoken') }}" \
  --form-string "user={{ salt['pillar.get']('pushuser') }}" \
  --form-string "message=$(cat $filelist  )" \
https://api.pushover.net/1/messages.json

sleep 60
echo "running the sneakernet script to clean up the files"
$sneakernet
sleep 60
rm -rf $filelist

