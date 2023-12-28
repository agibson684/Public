#!/bin/bash
command=$(dmenu -b <<EOF
Reboot
Halt
Quasselclient
Chrome
Iceweasel
Icedove
Nautilus
Calibre
Transmission
Quassel
Second Life
Terminator
Terminator-Desktop-Layout
XBMC
Libreoffice
Projectlibre
Akregator
Virt-manager
Zenmap
Etherape
VLC
Powermanga
Alsamixergui
Keepassx
Transmission-remote-gtk
Wireshark
Gparted
Gtk-redshift
Gpodder
Gpicview
Rox-filer
Nifty_apps.txt
Ymuse
Cantata
Lutris
Thunar
Scrot
Scrot Post
EOF
)
case "$command" in
"Reboot")
exec gksudo /bin/systemctl reboot
;;
"Halt")
exec gksudo /bin/systemctl poweroff
;;
"Quasselclient")
exec QT_QPA_PLATFORM=xcb quasselclient
;;
"Chrome")
exec /usr/bin/flatpak run --branch=stable --arch=x86_64 --command=/app/bin/chromium org.chromium.Chromium &
;;
"Iceweasel")
exec /usr/bin/firefox  &
;;
"Icedove")
exec icedove &
;;
"Nautilus")
exec nautilus --no-desktop &
;;
"Calibre")
exec calibre &
;;
"Transmission")
exec transmission-qt  -p 9091 -r joxer  -u erin -w password &
;;
"Quassel") 
exec quasselclient &
;;
"Second Life")
exec /opt/secondlife-install/secondlife &
;;
"Terminator")
exec terminator &
;;
"Terminator-Desktop-Layout")
exec /usr/bin/terminator -l Erin &
;;
"XBMC")
exec /usr/bin/kodi &
;;
"Libreoffice")
exec /home/THRACE/erin/bin/libreoffice.sh &
;;
"Projectlibre")
exec /usr/bin/projectlibre &
;;
"Akregator")
exec akregator &
;;
"Virt-manager")
exec virt-manager &
;;
"Etherape")
exec gksudo 'etherape -l 20  -r /media/downloads/mycapture.pcap' &
;;
"Zenmap")
exec gksudo 'zenmap' &
;;
"VLC")
exec vlc &
;;
"Powermanga")
exec powermanga &
;;
"Alsamixergui")
exec alsamixergui &
;;
"Keepassx")
exec keepassx &
;;
"Transmission-remote-gtk")
exec transmission-remote-gtk &
;;
"Wireshark")
exec gksudo wireshark &
;;
"Gparted")
exec gksudo gparted &
;;
"Gtk-redshift")
exec redshift -l 28:81 &
;;
"Gpodder")
exec gpodder &
;;
"Gpicview")
exec gpicview &
;;
"Rox-filer")
exec rox-filer &
;;
"Ymuse")
exec /usr/bin/ymuse &
;;
"Cantata")
exec /usr/bin/cantata &
;;
"Lutris")
exec /usr/bin/lutris &
;;
"Thunar")
exec /usr/bin/thunar &
;;
"Scrot")
exec /home/erin/bin/scrot.sh &
;;
"Scrot Post")
exec /home/erin/bin/scrot.sh post &
;;
esac

