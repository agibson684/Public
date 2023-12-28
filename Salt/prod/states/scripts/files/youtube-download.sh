#!/bin/bash 

video-id="$(youtube-dl --get-id -v https://www.youtube.com/c/MarthaStewart/videos)"
echo $video-id
  for i in "${video-id[@]}"
    do
     echo "$i"
done 
