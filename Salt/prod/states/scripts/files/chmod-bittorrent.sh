#!/bin/bash
date
renice 10 $$
ionice -c3 -p$$
bittorrent_done=/media/bittorrent/completed/
bittorrent_file=/media/bittorrent/transmission-home/torrents/
chmod -R  777 $bittorrent_done $bittorrent_file
