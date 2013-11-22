#!/bin/bash
#this function find all the .rar files in said  directory and freezes them to their original state for archive to dvd. 
function freeze {
arr=(*.rar)
 for x in "${arr[@]}"; do

 /usr/local/bin/freeze.sh "$x"  > "shield.$x"
 done
 }
 # this function  melts the archived files and retrives any broken bits as best as it can.
 function melt {
 arr=(shield.*.rar)
  for x in "${arr[@]}"; do

   /usr/local/bin/melt.sh "$x"  > "unshield.$x"
   done
    for file in unshield.shield.* ;
     do mv "$file" "${file#unshield.shield.}"
       done

    }
    
echo "what do you want to do?  freeze rar files or  melt rar files?"
echo "freeze"
echo "melt"
read option 
case "$option" in 

"freeze" ) 
freeze
;;

"melt" ) 
melt 
;;
esac
