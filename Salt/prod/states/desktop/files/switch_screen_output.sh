#!/bin/bash

if [ -z "$1" ]; then
    echo "Usage: $0 hdmi/dvi" >&2
    echo "Valid outputs:" >&2
    xrandr  >&2
    exit 1
fi
#REZ for  smaller hdmi screen# xrandr --output HDMI-0 --mode 1360x768

#fix the res of medium tv, and put it left of primary screen
output="$1"
if [[ $output -eq 1 ]]; then 
 #xrandr --output HDMI-0  --auto --left-of DVI-I-0
 #xrandr --output HDMI-0  --left-of DVI-I-1 --mode 1360x768
 #xrandr --output DP-0 --auto --above HDMI-0
 #xrandr --output DP-2 --auto --left-of HDMI-0
xrandr --output HDMI-1  --left-of DP-3
xrandr --output DP-2 --auto --left-of HDMI-1 
 xrandr --output DP-3 --auto --right-of HDMI-1 
 xrandr --output  DP-2 --rotate left
 xrandr --output  DP-3 --rotate right
 xrandr --output  HDMI-1 --rotate normal
exit 
fi
#turnoff  big tv
if [[ $output -eq 2 ]]; then 
xrandr --output DP-0 --off
exit
fi
#turnoff little monitor and big tv
if [[ $output -eq 3 ]]; then 
xrandr --output DP-2 --off
xrandr --output DP-0 --off
exit
fi
#big  screen and  big sanyo tv
if [[ $output -eq 4 ]]; then
exit
fi

