#!/bin/bash 
sleep='sleep 10'
[[ -f ~/.Xresources ]] && xrdb -merge -I$HOME ~/.Xresources
xcompmgr -c &
xrdb -merge .Xresources
xmodmap -e "clear Lock" -e "keycode 0x42 = Escape"
$sleep 
xset s off -dpms
#xsetroot -cursor_name left_ptr
#xsetroot -solid 'purple'
#going random now peeps
erin@terreis:/home/THRACE/erin$ xrandr --output HDMI-A-0  --left-of DisplayPort-2
erin@terreis:/home/THRACE/erin$xrandr --output DisplayPort-0 --rotate right --right-of DisplayPort-2
erin@terreis:/home/THRACE/erin$xrandr --output DisplayPort-0 --rotate right
erin@terreis:/home/THRACE/erin$xrandr --output DisplayPort-1  --rotate left
erin@terreis:/home/THRACE/erin$xrandr --output HDMI-A-0  --rotate  left
/home/THRACE/erin/bin/wallpaper.sh &
PATH=$HOME/bin:/usr/sbin:$PATH
tilix &
#$sleep  
#tilix &
$sleep 
/home/THRACE/erin/bin/mount-sshfs.sh 1  &
udiskie &
$sleep 
#slack &
#$sleep  
#/usr/bin/cantata &
#$sleep
/usr/bin/firefox &
$sleep 
quasselclient & 
$sleep 
exec /usr/bin/flatpak run --branch=stable --arch=x86_64 --command=/app/bin/chromium org.chromium.Chromium &
$sleep
redshift &
