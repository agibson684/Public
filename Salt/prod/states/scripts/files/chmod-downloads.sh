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

chmod -R  777 $downloads
chown -R  "debian-transmission:users" $downloads
