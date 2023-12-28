#!/bin/bash
servers=(xena gabrielle solan eve joxer testing services aries calisto terreis lyceus ephiny cyane)
for i in ${servers[@]};do
for y in `seq 1 10` ;do
 touch /pool/BACKUP/$i/backup.day.$y.bz2.done
 touch /pool/BACKUP/$i/backup.week.$y.bz2.done
 touch /pool/BACKUP/$i/backup.month.$y.bz2.done
 touch /pool/BACKUP/$i/backup.day.$y.bz2
 touch /pool/BACKUP/$i/backup.week.$y.bz2
 touch /pool/BACKUP/$i/backup.month.$y.bz2
rm   /pool/BACKUP/$i/daily/backup.day.$y.bz2
rm  /pool/BACKUP/$i/weekly/backup.week.$y.bz2
rm  /pool/BACKUP/$i/monthly/backup.month.$y.bz2


 done
done
