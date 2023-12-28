#!/bin/bash 
set -x
#i=0
#while  [ $i != 100 ]
#do 
#i=$[$i+1]
#touch  "movies $i.avi"
#echo  "movies $i.avi"
#done



 arr=(*.avi)
 for x in "${arr[@]}"; do
	 mkdir  "${x%.avi}" 
	 mv "$x"   "${x%.avi}" 
 done

 arr=(*.mp4)
 for x in "${arr[@]}"; do
         mkdir  "${x%.mp4}" 
         mv "$x"   "${x%.mp4}" 
 done

 arr=(*.flv)
 for x in "${arr[@]}"; do
         mkdir  "${x%.flv}" 
         mv "$x"   "${x%.flv}" 
 done

 arr=(*.mkv)
 for x in "${arr[@]}"; do
         mkdir  "${x%.mkv}" 
         mv "$x"   "${x%.mkv}" 
 done

