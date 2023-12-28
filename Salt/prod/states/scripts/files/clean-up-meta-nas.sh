#!/bin/bash
target=/pool/TV_SHOWS/
echo $target
echo 'cleaning up dir'
find  $target -type f  -iname "sample.*" -exec rm -v  '{}' \; >> /var/log/clean-up-meta-nas.log
find  $target -type f  -iname "ETRG.mp4" -exec rm -v  '{}' \; >> /var/log/clean-up-meta-nas.log
find  $target -type f  -iname "RARBG_DO_NOT_MIRROR.exe" -exec rm -v  '{}' \; >> /var/log/clean-up-meta-nas.log
find  $target -type f  -iname "*.test" -exec rm -v  '{}' \; >> /var/log/clean-up-meta-nas.log
find  $target -type f  -iname "RARBG.txt" -exec rm -v  '{}' \; >> /var/log/clean-up-meta-nas.log
target=/pool/MOVIES/
echo $target
echo 'cleaning up dir'
find  $target -type f  -iname "sample.*" -exec rm -v  '{}' \; >> /var/log/clean-up-meta-nas.log
find  $target -type f  -iname "ETRG.mp4" -exec rm -v  '{}' \; >> /var/log/clean-up-meta-nas.log
find  $target -type f  -iname "RARBG_DO_NOT_MIRROR.exe" -exec rm -v  '{}' \; >> /var/log/clean-up-meta-nas.log
find  $target -type f  -iname "*.test" -exec rm -v  '{}' \; >> /var/log/clean-up-meta-nas.log
find  $target -type f  -iname "RARBG.txt" -exec rm -v  '{}' \; >> /var/log/clean-up-meta-nas.log
echo 'cleaned up files for the following date!' >> /var/log/clean-up-meta-nas.log
echo $(date +%Y-%m-%d) >> /var/log/clean-up-meta-nas.log
