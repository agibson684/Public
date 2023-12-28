#!/bin/bash
date
renice 10 $$
ionice -c3 -p$$
backup=/pool/BACKUP/
downloads=/pool/DOWNLOADS
movies=/pool/MOVIES
tv=/pool/TV_SHOWS
misc=/pool/MISC
music=/pool/MUSIC
apps=/pool/APPS
public=/pool/PUBLIC
private=/pool/PRIVATE
complete=/pool/COMPLETE
lxc="/var/lib/lxc/*/"
echo 'changing downloads complete and public '
chmod -R  777 $downloads $complete $public
#chown -R  "debian-transmission:users" $downloads $complete
echo 'changing apps movies misc music private and tv '
chmod -R  775 $apps $misc $music $private 
chmod -R 777 $tv $movies
chown -R  "erin:admins" $movies $apps $misc $music $tv /pool/MISC/erins_stuff
chmod -R  700 /pool/MISC/erins_stuff /pool/MISC_VIDS
chmod -R  770 /pool/buying_house_documents/
chown  "root:admins" /$lxc 
chmod  770 $lxc
echo 'changing backups'
chmod  755   $backup
chmod  777   $backup/*
chmod 750 $backup/misc-backups $backup*/daily/ $backup*/weekly/ $backup*/monthly/
chown -R  "root:admins"  $backup
echo 'changing private'
chmod  701 /pool/PRIVATE/erin
chown  "erin:admins" /pool/PRIVATE/erin
echo 'changing misc_vids'
chown -R 'erin:root' /pool/MISC_VIDS 
