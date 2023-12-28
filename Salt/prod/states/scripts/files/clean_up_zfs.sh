#!/bin/bash 
zfs list -t snapshot -o name  | \grep ^pool/COMPLETE@zfs-auto-snap | tac |  xargs -n 1 zfs destroy
zfs list -t snapshot -o name  | \grep ^pool/DOWNLOADS@zfs-auto-snap | tac |  xargs -n 1 zfs destroy
zfs list -t snapshot -o name  | \grep ^pool/TV_SHOWS@zfs-auto-snap | tac |  xargs -n 1 zfs destroy
zfs list -t snapshot -o name  | \grep ^pool/MOVIES@zfs-auto-snap | tac |  xargs -n 1 zfs destroy
zfs list -t snapshot -o name  | \grep ^pool/PUBLIC@zfs-auto-snap | tac |  xargs -n 1 zfs destroy
zfs list -t snapshot -o name  | \grep ^pool/PRIVATE@zfs-auto-snap | tac |  xargs -n 1 zfs destroy
zfs list -t snapshot -o name  | \grep ^pool@zfs-auto-snap | tac |  xargs -n 1 zfs destroy
zfs list -t snapshot -o name  | \grep ^pool/APPS@zfs-auto-snap | tac |  xargs -n 1 zfs destroy
zfs list -t snapshot -o name  | \grep ^pool/BACKUP@zfs-auto-snap | tac |  xargs -n 1 zfs destroy
zfs list -t snapshot -o name  | \grep ^pool/MISC@zfs-auto-snap | tac |  xargs -n 1 zfs destroy
zfs list -t snapshot -o name  | \grep ^pool/MISC_VIDS@zfs-auto-snap | tac |  xargs -n 1 zfs destroy
zfs list -t snapshot -o name  | \grep ^pool/MUSIC@zfs-auto-snap | tac |  xargs -n 1 zfs destroy
zfs list -t snapshot -o name  | \grep ^pool/NEXTCLOUD@zfs-auto-snap | tac |  xargs -n 1 zfs destroy
zfs list -t snapshot -o name  | \grep ^pool/.reserve@zfs-auto-snap | tac |  xargs -n 1 zfs destroy

