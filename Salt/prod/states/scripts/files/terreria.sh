#!/bin/bash 
downloads = /media/sync_downloads/
saved_games = /home/erin/.local/share/Terraria/Players/
cp -v $saved_games/* /media/sync_backup/
cp -v $downloads  $saved_games
