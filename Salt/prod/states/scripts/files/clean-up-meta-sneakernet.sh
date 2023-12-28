#!/bin/bash
target=/mnt/disk/ 
echo $target  
echo 'cleaning up dir'
find  $target -type f  -iname "*.PNG" -exec rm -v  '{}' \;  > /var/log/clean-up-meta-sneakernet.log
find  $target -type f  -iname "*.nfo" -exec rm -v  '{}' \;  >> /var/log/clean-up-meta-sneakernet.log
find  $target -type f  -iname "*.txt" -exec rm -v  '{}' \;  >> /var/log/clean-up-meta-sneakernet.log
find  $target -type f  -iname "*.jpg" -exec rm -v  '{}' \;  >> /var/log/clean-up-meta-sneakernet.log
find  $target -type f  -iname "*.jpeg" -exec rm -v  '{}' \; >> /var/log/clean-up-meta-sneakernet.log 
find  $target -type f  -iname "*.tbn" -exec rm -v  '{}' \; >> /var/log/clean-up-meta-sneakernet.log
find  $target -type f  -iname "*.info" -exec rm -v  '{}' \;  >> /var/log/clean-up-meta-sneakernet.log
find  $target -type f  -iname "*.ign" -exec rm -v  '{}' \;  >> /var/log/clean-up-meta-sneakernet.log
find  $target -type f  -iname "*.xml" -exec rm -v  '{}' \;  >> /var/log/clean-up-meta-sneakernet.log
find  $target -type f  -iname "sample.*" -exec rm -v  '{}' \;  >> /var/log/clean-up-meta-sneakernet.log
find  $target -type f  -iname "*Thumbs.db" -exec rm -v  '{}' \;  >> /var/log/clean-up-meta-sneakernet.log
find  $target -type f  -iname "ETRG.mp4" -exec rm -v  '{}' \;  >> /var/log/clean-up-meta-sneakernet.log
find  $target -type f  -iname "RARBG_DO_NOT_MIRROR.exe" -exec rm -v  '{}' \;  >> /var/log/clean-up-meta-sneakernet.log
find  $target -type f  -iname "*.test" -exec rm -v  '{}' \;  >> /var/log/clean-up-meta-sneakernet.log
find  $target -type f  -iname "RARBG.txt" -exec rm -v  '{}' \; >> /var/log/clean-up-meta-sneakernet.log
echo 'cleaned up files for the following date!' >> /var/log/clean-up-meta-sneakernet.log
echo $(date +%Y-%m-%d) >> /var/log/clean-up-meta-sneakernet.log

