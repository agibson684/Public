#!/bin/bash
# Hello and welcome to the source code of my own Database program!
# It is written in Bash Script and uses common applications you will find in linux.
# most are free, except for rar.. 
# one line to give the program's name and an idea of what it does.
#
#Copyright (C) 2007  Erin C. Gibson
#
#This program is free software; you can redistribute it and/or
#modify it under the terms of the GNU General Public License
#as published by the Free Software Foundation; either version 
#of the License, or (at your option) any later version.
#
#This program is distributed in the hope that it will be useful,
#but WITHOUT ANY WARRANTY; without even the implied warranty of
#MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#GNU General Public License for more details.
#
#You should have received a copy of the GNU General Public License
#along with this program; if not, write to the Free Software
#Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301, USA.

#Mounts the cdrom
#mount /dev/sr0 /media/cdrom
#mount /dev/sr1 /media/cdrom2
# this function removes the reed solomon codes from said rar file. if it is shielded.

 function melt {
  arr=(shield.*.rar)
  for x in "${arr[@]}"; do
  /usr/local/bin/melt.sh "$x"  > "unshield.$x"
   done 
       }
function drill {
 echo ' what is the broadest pattern to be searched?'
 	read patte
 echo ' what is the next broadest pattern to be searched?'
        read patte1
	grep "$patte" /home/erin/bin/database.db | grep "$patte1" | sort -u | less
     #read patte 
     #grep -i $patte database.db > temp_grep.txt
     #echo 'what is the next pattern?'
     #read patte
     #while ! [ -z $patte ] ; do
     # grep -i $patte temp_grep.txt > temp_grep1.txt 
     # echo 'what is the next pattern?'
     # read patte 
     # cat temp_grep1.txt > temp_grep.txt
     # done
     #cat temp_grep1.txt | sort | less
}
function search_copy {
find $1 -maxdepth 100 -type f -name \*.$2  | xargs -i cp -rv  {} $3
#<- where the order of arguments is [source dir] [file type extension] [destination dir]
}   
#Function for adding new items to the database
function new {

function sedme {

    sed s?^?`date +%y-%m-%d`:? /tmp/database/tmp_sed.txt | sed s#^#`${name}`:#| sed 's?^?'${cata}':?' >> /tmp/database/tmp_sed1.txt
    cat /tmp/database/tmp_sed1.txt >> /home/erin/bin/database.db
    
    }
mkdir -p /tmp/database/
echo 'the name of the disk'
   awk '{print $2}' /dev/sr0 | head -1 > /tmp/database/cdrom.txt
   cat /tmp/database/cdrom.txt
 name="cat /tmp/database/cdrom.txt"

      FILES=(/media/cdrom/shield*.rar); if [ -e "$FILES" ] ; then
      echo 'making directory /tmp/database/'
      mkdir -p /tmp/database/
      echo 'finding all shield*.rar files and copying them to /tmp/database.... this may take awhile'
      find /media/cdrom/  -maxdepth 10 -type f -name \shield*.rar | xargs -i cp  {} /tmp/database/
         echo 'changin directory to /tmp/database/'
         cd /tmp/database/ 
	 echo 'finding all shielded rar files in directory and melting them, will take awhile'
        melt 
	echo 'removing unshield.shield prefixes from files that are melted'
        for file in unshield.shield.* ;
        do mv "$file" "${file#unshield.shield.}"
        done
	echo 'finding all the  new rar files and adding them to the database'
        find  /tmp/database/  -maxdepth 10 -type f -name \*.rar | xargs -i rar lb {} > /tmp/database/tmp_sed.txt
        sedme
      fi 
     
    FILES=(/media/cdrom/*.rar); if [ -e "$FILES" ] ; then 
   find /media/cdrom/  -maxdepth 10 -type f -name \*.rar | xargs -i rar lb {} > /tmp/database/tmp_sed.txt
    sedme
   fi 
    FILES=(/media/cdrom/*.tar); if [ -e "$FILES" ] ; then
   find /media/cdrom/  -maxdepth 10 -type f -name \*.tar | xargs -i tar -tzf {} > /tmp/database/tmp_sed.txt   
   sedme
   fi
     FILES=(/media/cdrom/*.tar.gz); if [ -e "$FILES" ] ; then
   find /media/cdrom/  -maxdepth 10 -type f -name \*.tar.gz | xargs -i tar -tzf {} > /tmp/database/tmp_sed.txt
   sedme
   fi
     FILES=(/media/cdrom/*.gz); if [ -e "$FILES" ] ; then
  find /media/cdrom/  -maxdepth 10 -type f -name \*.gz | xargs -i tar -tzf {} > /tmp/database/tmp_sed.txt
   sedme
   fi
     FILES=(/media/cdrom/*.zip); if [ -e "$FILES" ] ; then
   find /media/cdrom/  -maxdepth 10  -type f -name \*.zip | xargs -i tar -tzf {} > /tmp/database/tmp_sed.txt
   sedme
    fi
    find /media/cdrom/* > /tmp/database/tmp_sed.txt
     sedme 
     cat /tmp/database/tmp_sed.txt
}   
   
   function find_meta_file_ext {
   echo 'Type extension you wish to find'
   echo 'example .ext'
   read ext
   echo 'found this many' "$ext"
   cut -d: -f4  /home/erin/bin/database.db | sort -u | grep -i ${ext} | wc -l
   echo 'Amount of disks associated with extension' "$ext"
   grep -i ${ext}  /home/erin/bin/database.db | cut -d: -f2 | sort -u | wc -l
   echo 'Said disks containing extension' "$ext"
   grep -i ${ext} /home/erin/bin/database.db | cut -d: -f2 | sort -u
   }
function show_cata {
cut -d: -f1  database.db | sort -u  | less
  }
function search_copy2 {
cp -rv  movies* /home/erin/downloads/movies/
cp -rv  app* /home/erin/downloads/misc_vids/
cp -rv  misc_vid*  /home/erin/downloads/apps/
     }
function multi {
  echo 'this is the multi search please imput as many patterns as you like'
   pattern=0 
 while  [ "$pattern" != "" ]
do
echo ' what is the pattern?'  
read pattern
echo ${pattern} >> /tmp/database/pattern.txt
done
grep  -i --file=/tmp/database/pattern.txt /home/erin/bin/database.db > /tmp/database/tmp_grep1.txt
rm /tmp/database/pattern.txt
}
while [ "$option" != "quit" ]
do
#set -x
echo '------------------------------------------------------------'
echo 'Bash_Database version 1, Copyright (C) 2007 Erin  C. Gibson
Bash_Database comes with ABSOLUTELY NO WARRANTY; for details
type "show w".  This is free software, and you are welcome
to redistribute it under certain conditions; type "show w"
for details.'
echo '----------------------------------------------------------'
echo 'what do you want to do?'
echo 'show cata?'
echo 'find ext?'
echo 'new?'
echo 'fastadd?'
echo 'list?'
echo 'search?'
echo 'multi?'
echo 'drill?'
echo 'copy?'
echo 'backup?'
echo 'quit?'
read option
case "$option" in
"show w" )
echo 'This program is free software; you can redistribute it and/or modify it under the terms of the GNU General Public License as published by the Free Software Foundation; either version 2 of the License, or (at your option) any later version. This program is distributed in the hope that it will be useful,but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for more details.You should have received a copy of the GNU General Public License along with this program; if not, write to the Free Software Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301, USA.'a
;;
"new"  )
mount  /media/cdrom
   echo 'what is the category?'
      read cata
   new
   eject /dev/sr0
   ;;
"show cata" )
	show_cata
	;;
"find ext" )
find_meta_file_ext
;;
"fastadd" ) 
   echo 'what is the category?'
         read cata
      while  [ "$answer" != "y" ] 
      do 
      mount  /media/cdrom
      sleep 5 
      mount  /media/cdrom 
      new 
      eject /media/cdrom 
      echo 'do you wish to quit?'
      read answer 
      done
      ;;
 "list" )
	cat /home/erin/bin/database.db | sort -u | less
	;;
 "search" )
 echo 'What do you wish to search for?'
   read search 
   grep -i ${search} /home/erin/bin/database.db | sort -u | less
   ;;
"drill" )
 drill
     ;;
"copy" )
      while  [ "$num" != "0" ]
            do
            mount /media/cdrom
search_copy ./ avi /home/erin/downloads/
search_copy ./ mpeg /home/erin/downloads/
search_copy ./ rm /home/erin/downloads/
search_copy ./  rmvb /home/erin/downloads/
search_copy ./ mpg /home/erin/downloads/
search_copy ./ jpeg /home/erin/downloads/misc_vids/
search_copy ./ jpg /home/erin/downloads/misc_vids/
#search_copy ./ rar /home/erin/downloads/
#search_copy ./ exe /home/erin/downloads/apps
search_copy ./ zip /home/erin/downloads/
search_copy ./ tar /home/erin/downloads/
search_copy ./ gz /homee/erin/downloads/

search_copy2

     eject cdrom
      echo 'are you finished?'
     read answer
      if [ "$answer" = "y" ] ; then
	        num=0
	    fi
	    done
	    ;;
"multi" )
multi
cat /tmp/database/tmp_grep1.txt | sort | less
;;
"backup" )
tar cvvzf  database.sh.tar.gz /home/erin/bin/database.*
;;
"quit" )
esac
rm -rf /tmp/database/* 
done
exit 0
