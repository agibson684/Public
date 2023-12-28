#!/bin/bash 
date
HOME=/media/backup/cfg2html
echo 'compressing the old files in the  archive directory'
gzip -9 $HOME/cfg2html-archive/*`date -d 'yesterday' +%Y-%m-%d`*
find $HOME/cfg2html-archive/  -type f -mtime +60 -exec rm -v  '{}' \;
echo 'executing cfg2html to $HOME/'
/usr/bin/cfg2html-linux  -o $HOME/
mkdir -p /$HOME//cfg2html-archive/
cp $HOME/`hostname`.txt $HOME/cfg2html-archive/`hostname -f`-`date +%Y-%m-%d`.txt
cp $HOME/`hostname`.partitions.save $HOME/cfg2html-archive/`hostname -f`.partitions-`date +%Y-%m-%d`.save
cp $HOME/`hostname`.html $HOME/cfg2html-archive/`hostname -f`-`date +%Y-%m-%d`.html
cp $HOME/`hostname`.html  /media/Backup/cfg2html/`hostname`.html 
cp $HOME/`hostname`.err $HOME/cfg2html-archive/`hostname -f`-`date +%Y-%m-%d`.err
cp $HOME/`hostname`.partitions.save $HOME/cfg2html-archive/`hostname -f`.partitions-`date +%Y-%m-%d`.save
cp $HOME/`hostname`.html $HOME/cfg2html-archive/`hostname -f`-`date +%Y-%m-%d`.html
cp $HOME/`hostname`.html  /media/backup/cfg2html/`hostname`.html 
cp $HOME/`hostname`.err $HOME/cfg2html-archive/`hostname -f`-`date +%Y-%m-%d`.err


