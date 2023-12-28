#!/bin/bash 
set -x
#this sets the paramaters for the search string and the page numbers and then addd ones more so we can get through them all
search="$1"
page="$2"
let page=page+1
p=0
#while p is less than page   curl tpb for said said page numbers and make an array of the magnets to add to tranmission remote  box feathers
while [  $p -ne $page ]; do
mapfile -t magnets < <(curl -s https://thepiratebay.org/search/"$search"/"$p"/99/0 | sed -rn '/magnet/{s/.*(magnet:[^"]*).*/\1/g;p}')
 for i in "${magnets[@]}"
  do
print "$i"
  /usr/bin/transmission-remote docker.thrace.lan:9091 --auth eryn:password --add  "$i"
 
done
let p=p+1
done

