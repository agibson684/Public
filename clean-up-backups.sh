#!/bin/bash 
ionice -c3 -p$$
renice 10 $$
# i am commenitng out the smaller  server for archival purposes they can be deleted later
find /media/Backup/gabrielle/daily -mtime +7 -exec rm -v  '{}' \;
#find /media/Backup/cyrene/daily -mtime +7 -exec rm -v  '{}' \;
find /media/Backup/eve/daily -mtime +7 -exec rm -v  '{}' \;
find /media/Backup/lyceus/daily -mtime +7 -exec rm -v  '{}' \;
#find /media/Backup/livia/daily -mtime +7 -exec rm -v  '{}' \;
find /media/Backup/xena/daily -mtime +7 -exec rm -v  '{}' \;
find /media/Backup/joxer/daily -mtime +7 -exec rm -v  '{}' \;
find /media/Backup/solan/daily -mtime +7 -exec rm -v  '{}' \;
find /media/Backup/services/daily -mtime +7 -exec rm -v  '{}' \;
find /media/Backup/testing/daily -mtime +7 -exec rm -v  '{}' \;

find /media/Backup/gabrielle/weekly  -mtime +31 -exec rm -v  '{}' \;
find /media/Backup/solan/weekly  -mtime +31 -exec rm -v  '{}' \;
find /media/Backup/eve/weekly  -mtime +31 -exec rm -v  '{}' \;
find /media/Backup/joxer/weekly  -mtime +31 -exec rm -v  '{}' \;
find /media/Backup/lyceus/weekly  -mtime +31 -exec rm -v  '{}' \;
find /media/Backup/xena/weekly  -mtime +31 -exec rm -v  '{}' \;
find /media/Backup/services/weekly  -mtime +31 -exec rm -v  '{}' \;
find /media/Backup/testing/weekly  -mtime +31 -exec rm -v  '{}' \;

find /media/Backup/gabrielle/monthly  -mtime +365 -exec rm -v  '{}' \;
find /media/Backup/solan/monthly  -mtime +365 -exec rm -v  '{}' \;
find /media/Backup/eve/monthly  -mtime +365 -exec rm -v  '{}' \;
find /media/Backup/joxer/monthly  -mtime +365 -exec rm -v  '{}' \;
find /media/Backup/lyceus/monthly  -mtime +365 -exec rm -v  '{}' \;
find /media/Backup/xena/monthly  -mtime +365 -exec rm -v  '{}' \;
find /media/Backup/services/monthly  -mtime +365 -exec rm -v  '{}' \;
find /media/Backup/testing/monthly  -mtime +365 -exec rm -v  '{}' \; 
