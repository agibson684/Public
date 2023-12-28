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

chmod -R  775 $misc 
chown -R  "erin:admins" $misc 
chmod -R  700 /pool/MISC/erins_stuff 
chown -R  "erin:admins" /pool/MISC/erins_stuff 
