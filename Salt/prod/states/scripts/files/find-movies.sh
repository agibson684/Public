#!/bin/bash

renice 10 $$
ionice -c3 -p$$

ext=(
'avi'
'mp4'
'mpg'
'rm'
'mov'
'mpeg'
'mkv'
)
for i in "${ext[@]}";do
	echo 'searching current dir'
	find -iname "*.$i" 
 done
exit



