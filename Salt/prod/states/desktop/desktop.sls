{# we dont need this anymore not working at bookit
  xl2pd:
  service.disabled
#}
desktop_packages:
  pkg.installed:
    - pkgs:
      - powermanga
      - alsamixergui
      - libreoffice
      - mplayer
      - vlc
      - guake
      - nautilus
      - firefox-esr
#      - xscreensaver
#      - xscreensaver-data-extra
#      - xscreensaver-gl-extra
      - kodi
      - mencoder
      - terminator
      - w64codecs
      - icedtea-netx
      - ethtool
      - wakeonlan
      - keepassx
      - transmission-qt
      - transmission-cli
      - transmission-remote-gtk
#      - suckless-tools
      - deb-multimedia-keyring
      - trayer
      - etherape
      - wireshark
      - taskwarrior
      - slurm
      - unison
      - powertop
      - calcurse
      - silversearcher-ag
      - feh 
#      - libudev-dev
      - build-essential
#      - zlib1g-dev
      - sshfs
      - gparted
      - xdaliclock
      - mosh
      - tig
      - redshift
      - gpodder
      - gpicview
      - rox-filer
      - nmap
#      - xcompmgr
      - cantata
#      - ymuse
      - sipcalc
      - mtr
      - siege
      - network-manager
      - openconnect
      - network-manager-gnome
      - network-manager-openconnect
      - thunar 
      - make
      - ccbuild
      - build-essential
#      - libx11-dev
#      - libxft-dev
#      - libxinerama-dev
#      - libgdk3.0-cil-dev
#      - libwebkit2gtk-4.0-37      
      - udiskie
      - python3-pip
      - apt
      - gconf2
      - apt-transport-https
      - network-manager-l2tp
      - safe-rm
 #     - virtualbox
      - bluez
      - blueman
      - bluetooth
      - pulseaudio-module-bluetooth
      - bind9utils
      - dnsutils
      - spice-html5
 #     - libudev-dev 
{#      - qt5-default #}
  #    - zlib1g-dev 
  #    - libappindicator-dev 
  #    - libpulse-dev 
  #    - libquazip5-dev 
  #    - libqt5x11extras5-dev 
  #    - libxcb-screensaver0-dev 
  #    - libxcb-ewmh-dev 
  #    - libxcb1-dev 
  #    - qttools5-dev
      - clusterssh
      - firmware-iwlwifi
      - imagemagick
      - jq
      - command-not-found
 #     - rxvt-unicode
 #     - dbus-x11
      - autocutsel 
      - stacer
      - tilix
      - i3
      - quassel-client
      - sway
      - discord
      - scrot
      #scrot replacement need to modify scripts for this  app 
      - grim 
include:
  - desktop.path
  - desktop.ssh_config
  
/home/THRACE/erin/bin/wallpaper.sh:
  file.managed:
    - user: erin
    - group: erin
    - mode: 0740
    - source: salt://desktop/files/wallpaper.sh

/home/THRACE/erin/bin/apps.sh:
  file.managed:
    - user: erin
    - group: admins
    - mode: 0740
    - source: salt://desktop/files/apps.sh

/opt/nifty_apps.txt:
  file.managed:
    - user: root
    - group: admins
    - mode: 0665
    - source: salt://desktop/files/nifty_apps.txt

/home/erin/bin/scrot.sh:
  file.managed:
    - user: erin
    - group: admins
    - mode: 0740
    - source: salt://desktop/files/scrot.sh

/home/THRACE/erin/bin/switch_screen_output.sh:
  file.managed:
    - user: erin
    - group: admins
    - mode: 0740
    - source: salt://desktop/files/switch_screen_output.sh

/home/THRACE/erin/bin/switch_audio_output.sh:
  file.managed:
    - user: erin
    - group: admins
    - mode: 0740
    - source: salt://desktop/files/switch_audio_output.sh
/home/THRACE/erin/bin/bluetooth_connect.sh:
  file.managed:
    - user: erin 
    - group: admins
    - mode: 0740
    - source: salt://desktop/files/bluetooth_connect.sh

/home/THRACE/erin/.xmonad/xmonad-start:
  file.managed:
    - user: erin
    - group: admins
    - mode: 0740
    - source: salt://desktop/files/start-desktop
/home/THRACE/erin/bin/startup.sh:
  file.managed:
    - user: erin
    - group: admins
    - mode: 0740
    - source: salt://desktop/files/startup.sh

/usr/sbin/xmonad-start:
  file.symlink:
    - user: erin
    - group: admins
    - mode: 0740
    - target: /home/THRACE/erin/.xmonad/xmonad-start

/usr/share/xsessions/xmonad.desktop:
  file.managed:
    - user: erin
    - group: admins
    - mode: 0740
    - source: salt://desktop/files/xmonad.desktop

/home/THRACE/erin/.xmonad/xmonad.hs:
  file.managed:
    - user: erin
    - group: admins
    - mode: 0740
    - source: salt://desktop/files/xmonad.hs

/home/THRACE/erin/bin/mount-sshfs.sh:
  file.managed:
    - user: erin
    - group: admins
    - mode: 0740
    - source: salt://desktop/files/mount-sshfs.sh

/home/THRACE/erin/bin/libreoffice.sh:
  file.managed:
    - user: erin
    - group: admins
    - mode: 0740
    - source: salt://desktop/files/libreoffice.sh

/srv/keepassx:
  file.directory:
    - user: erin
    - group: admins
    - mode: 0740

/home/erin/bin/magnet:
  file.managed:
    - user: erin
    - group: admins
    - mode: 0740
    - source: salt://desktop/files/magnet
/home/THRACE/erin/bin/dmenu_handler:
  file.managed:
    - user: erin
    - group: admins
    - mode: 0740
    - source: salt://desktop/files/dmenu_handler
{#
files
~/.local/share/applications/magnet.desktop 
 ~/Documents/magnet.desktop
~/.local/share/mime/packages/user-extension-magnet.xml
# xdg-settings get default-web-browser
# xdg-settings set default-web-browser ??
cmds
desktop-file-validate magnet.desktop 
desktop-file-install --dir=~/.local/share/applications ~/Documents/magnet.desktop
update-mime-database ~/.local/share/mime
#}
/home/THRACE/erin/bin/tsurf:
  file.managed:
    - user: erin
    - group: admins
    - mode: 0740
    - source: salt://desktop/files/tsurf
/home/THRACE/erin/bin/tsurf-bookmarks:
  file.managed:
    - user: erin
    - group: admins
    - mode: 0740
    - source: salt://desktop/files/tsurf-bookmarks
/home/THRACE/erin/bin/tsurf-matrix:
  file.managed:
    - user: erin
    - group: admins
    - mode: 0740
    - source: salt://desktop/files/tsurf-matrix

/usr/share/applications/surf.desktop:
  file.managed:
    - user: root
    - group: root
    - mode: 0740
    - source: salt://desktop/files/surf.desktop

/usr/share/applications/tsurf.desktop:
  file.managed:
    - user: root
    - group: root
    - mode: 0740
    - source: salt://desktop/files/tsurf.desktop

/usr/share/applications/tsurf-bookmarks.desktop:
  file.managed:
    - user: root
    - group: root
    - mode: 0740
    - source: salt://desktop/files/tsurf-bookmarks.desktop

/usr/share/applications/tsurf-matrix.desktop:
  file.managed:
    - user: root
    - group: root
    - mode: 0740
    - source: salt://desktop/files/tsurf-matrix.desktop

/home/THRACE/erin/.xmobarrc:
  file.managed:
    - user: erin
    - group: admins
    - mode: 0740
    - source: salt://desktop/files/.xmobarrc

/home/THRACE/erin/.kodi:
  file.symlink:
    - user: erin
    - group: admins
    - mode: 0740
    - target: /srv/.kodi

/home/THRACE/erin/.xsession:
  file.managed:
    - user: erin
    - group: erin
    - mode: 0700
    - source: salt://desktop/files/.xsession

/home/THRACE/erin/.config/redshift/redshift.conf:
  file.managed:
    - user: erin
    - group: erin
    - mode: 0700
    - source: salt://desktop/files/redshift/redshift.conf

/home/THRACE/erin/.config/redshift:
  file.directory:
    - user: erin
    - group: erin
    - mode: 0700
/etc/X11/xorg.conf.d/10-Monitor.conf:
  file.managed:
    - source: 'salt://desktop/files/{{ salt['pillar.get']('desktop:monitor') }}'
    - user: root
    - group: root
    - mode: 0744
/home/THRACE/erin/.config/i3:
  file.directory:
    - user: erin
    - group: erin
    - mode: 0766
/home/THRACE/erin/.config/i3/config:
  file.managed:
    - source: 'salt://desktop/files/{{ salt['pillar.get']('desktop:i3:config') }}'
    - user: erin
    - group: erin
    - mode: 0777
/home/THRACE/erin/.config/sway:
  file.directory:
    - user: erin
    - group: erin
    - mode: 0766
/home/THRACE/erin/.config/sway/config:
  file.managed:
    - source: 'salt://desktop/files/{{ salt['pillar.get']('desktop:sway:config') }}'
    - user: erin
    - group: erin
    - mode: 0777




















