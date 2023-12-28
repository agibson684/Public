#!/bin/bash

if [ -z "$1" ]; then
    echo "Usage: $0 1" >&2
    echo "Usage: $0 2" >&2
    exit 1
fi

output="$1"
if [[ $output -eq 1 ]]; then 
sshfs  -o allow_root erin@calisto:/pool/PRIVATE/ /mnt/private/
sshfs  -o allow_root erin@calisto:/pool/COMPLETE/ /mnt/complete/
sshfs  -o allow_root erin@calisto:/pool/MISC/ /mnt/misc/
sshfs  -o allow_root erin@calisto:/pool/MISC_VIDS/ /media/misc_vids/
sshfs  -o allow_root erin@calisto:/pool/DOWNLOADS/ /mnt/downloads/
sshfs  -o allow_root erin@calisto:/pool/MUSIC/ /mnt/sync_music/
exit 
fi
if [[ $output -eq 2 ]]; then 
fusermount -u /mnt/private/
fusermount -u /mnt/complete/
fusermount -u /mnt/misc/
fusermount -u /media/misc_vids/
fusermount -u /mnt/downloads/
fusermount -u /mnt/sync_music/
exit
fi
