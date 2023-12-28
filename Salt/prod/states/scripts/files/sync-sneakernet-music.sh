#!/bin/bash
target=/mnt/disk/
array_source_name=('/pool/MUSIC/' )
days="$1"
filelist=/var/tmp/filelist-music.txt
echo $target
  echo 'find all the new Music'
  cat /dev/null > $filelist
  for i in "${array_source_name[@]}";do
find  "${i[@]}"  -type f -mtime -"$days"  -iname "*.mp3" -exec ls '{}' \; >> $filelist
find  "${i[@]}"  -type f -mtime -"$days" -iname "*.flac" -exec ls '{}' \; >> $filelist
find  "${i[@]}"  -type f -mtime -"$days" -iname "*.ogg" -exec ls '{}' \; >> $filelist
done
sleep 60
nano $filelist
echo "syncing up the $target"
sleep 60
rsync -rltzuvs --protect-args  --files-from="$filelist" / "$target"
sleep 60
sleep 60
rm -rf $filelist

