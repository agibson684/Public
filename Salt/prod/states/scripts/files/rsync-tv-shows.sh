#/bin/bash 
 destination=/mnt/disk/
 rsync -avc /pool/TV_SHOWS/The\ Whispers $destination
 rsync -avc /pool/TV_SHOWS/Defiance $destination
 rsync -avc /pool/TV_SHOWS/Wayward\ Pines $destination
 rsync -avc /pool/TV_SHOWS/Penny\ Dreadful  $destination
 rsync -avc /pool/TV_SHOWS/Falling_Skies $destination
 rsync -avz /pool/TV_SHOWS/Mr.\ Robot  $destination
 rsync -avz /pool/TV_SHOWS/Futurama $destination
 rsync -avc /pool/TV_SHOWS/Star*Trek*   $destination 
 rsync  -avc /pool/TV_SHOWS/Enterprise* $destination
