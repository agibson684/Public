#!/bin/bash 
if [ "$1" = "" ]; then
echo 'please specify the playlist.m3u file it must be this format'
exit  1
fi
if [ "$2" = "" ]; then
echo  'please specify the directory to put the files in.'
exit 1
fi
echo copying files now
rsync -rltzuv --exclude  "*.flac" --files-from="$1"  / "$2"
