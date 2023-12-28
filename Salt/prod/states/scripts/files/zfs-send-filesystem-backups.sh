#!/bin/bash 
desthost=calisto.thrace.lan
snapshots=( pool/APPS@backup pool/BACKUP@backup pool/MISC@backup pool/MISC_VIDS@backup pool/MOVIES@backup pool/MUSIC@backup pool/TV_SHOWS@backup )
for i in ${snapshots[@]};
 do
/sbin/zfs snapshot ${i}
echo 'making snapshot ${i}'
/sbin/zfs send ${i} | ssh -i ~/.ssh/root@backup-zfs-calisto snapshotbackup@$desthost "sudo /sbin/zfs receive -F ${i%@backup}"
#if [ $? ==  0 ] ;  then
echo 'destroying snapshot ${i}'
 zfs destroy ${i}
#fi
done
exit


