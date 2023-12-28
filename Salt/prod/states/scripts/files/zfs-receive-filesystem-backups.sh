#!/bin/bash 
desthost=calisto.thrace.lan
snapshots=( pool/APPS@backup pool/BACKUP@backup pool/COMPLETE@backup pool/DOWNLOADS@backup pool/MISC@backup pool/MISC_VIDS@backup pool/MOVIES@backup pool/MUSIC@backup pool/PRIVATE@backup pool/PUBLIC@backup pool/TV_SHOWS@backup ) 
for i in ${snapshots[@]};
 do
cat  /pool/BACKUP/${i}.img.xz > unxz | zfs receive ${i}
if [ $? ==  0 ] ;  then
rm /pool/BACKUP/${i}.img.xz
fi
done
exit


