#!/bin/bash 
ionice -c3 -p$$
renice 10 $$
# i am commenitng out the smaller  server for archival purposes they can be deleted later
#find /pool/BACKUP/camera-pictures/ -type f -mtime +30 -exec rm -v '{}' \;
find /pool/BACKUP/*/daily -type f -mtime +7 -exec rm -v  '{}' \;
#find /pool/BACKUP/cyrene/daily -mtime +7 -exec rm -v  '{}' \;
#find /pool/BACKUP/eve/daily -type f -mtime +7 -exec rm -v  '{}' \;
#find /pool/BACKUP/lyceus/daily -type f -mtime +7 -exec rm -v  '{}' \;
#find /pool/BACKUP/ephiny/daily -type f -mtime +7 -exec rm -v  '{}' \;
#find /pool/BACKUP/livia/daily -mtime +7 -exec rm -v  '{}' \;
#find /pool/BACKUP/xena/daily -type f -mtime +7 -exec rm -v  '{}' \;
#find /pool/BACKUP/joxer/daily -type f -mtime +7 -exec rm -v  '{}' \;
#find /pool/BACKUP/solan/daily -type f -mtime +7 -exec rm -v  '{}' \;
#find /pool/BACKUP/services/daily -type f -mtime +7 -exec rm -v  '{}' \;
#find /pool/BACKUP/testing/daily -type f -mtime +7 -exec rm -v  '{}' \;
find /pool/BACKUP/*/weekly -type f -mtime +31 -exec rm -v  '{}' \;
#find /pool/BACKUP/solan/weekly -type f  -mtime +31 -exec rm -v  '{}' \;
#find /pool/BACKUP/eve/weekly  -type f  -mtime +31 -exec rm -v  '{}' \;
#find /pool/BACKUP/joxer/weekly -type f  -mtime +31 -exec rm -v  '{}' \;
#find /pool/BACKUP/lyceus/weekly -type f  -mtime +31 -exec rm -v  '{}' \;
#find /pool/BACKUP/xena/weekly -type f  -mtime +31 -exec rm -v  '{}' \;
#find /pool/BACKUP/services/weekly -type f  -mtime +31 -exec rm -v  '{}' \;
#find /pool/BACKUP/testing/weekly -type f   -mtime +31 -exec rm -v  '{}' \;
#find /pool/BACKUP/ephiny/weekly -type f   -mtime +31 -exec rm -v  '{}' \;
find /pool/BACKUP/*/monthly -type f  -mtime +182 -exec rm -v  '{}' \;
#find /pool/BACKUP/solan/monthly -type f  -mtime +365 -exec rm -v  '{}' \;
#find /pool/BACKUP/eve/monthly -type f  -mtime +365 -exec rm -v  '{}' \;
#find /pool/BACKUP/joxer/monthly -type f  -mtime +365 -exec rm -v  '{}' \;
#find /pool/BACKUP/lyceus/monthly -type f  -mtime +365 -exec rm -v  '{}' \;
#find /pool/BACKUP/xena/monthly -type f  -mtime +365 -exec rm -v  '{}' \;
#find /pool/BACKUP/services/monthly -type f  -mtime +365 -exec rm -v  '{}' \;
#find /pool/BACKUP/testing/monthly -type f  -mtime +365 -exec rm -v  '{}' \; 
#find /pool/BACKUP/ephiny/monthly -type f  -mtime +365 -exec rm -v  '{}' \; 
