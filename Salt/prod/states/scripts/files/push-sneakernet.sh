#!/bin/bash 
#work in progress for now need to put in variables and arrays and logic to go through popular tv shows and movies
#find /pool/TV_SHOWS/VICE/  -type f \( -iname "*.mkv" -or -iname "*.avi" -or -iname "*.mpg" -or -iname "*.mpeg"  \) -mtime -25 -exec rsync -rltzuv  '{}' /mnt/disk/  \;

