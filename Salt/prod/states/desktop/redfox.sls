redfox_packages:
  pkg.installed:
    - pkgs:
      - powermanga
      - alsamixergui
      - libreoffice
      - mplayer
      - vlc
      - nautilus
      - firefox-esr
      - xscreensaver
      - xscreensaver-data-extra
      - xscreensaver-gl-extra
      - kodi
      - kodi-bin 
      - mencoder
      - w64codecs
      - icedtea-netx
      - ethtool
      - wakeonlan
      - suckless-tools
      - deb-multimedia-keyring
      - trayer
      - unison
      - powertop
      - silversearcher-ag
      - feh 
      - libudev-dev
      - build-essential
      - zlib1g-dev
      - sshfs
      - gparted
      - tig
      - redshift
      - rox-filer
      - xcompmgr
      - cantata
      - network-manager
      - openconnect
      - network-manager-gnome
      - network-manager-openconnect
      - thunar 
      - make
      - ccbuild
      - build-essential
      - udiskie
      - python3-pip
      - apt
      - gconf2
      - apt-transport-https
      - network-manager-l2tp
      - safe-rm
      - bluez
      - blueman
      - bluetooth
      - pulseaudio-module-bluetooth
      - bind9utils
      - dnsutils
      - spice-html5
      - libudev-dev 
      - firmware-iwlwifi
      - imagemagick
      - command-not-found
      - tilix
      - silverjuke
      - projectm-pulseaudio
include:
  - desktop.path
  - desktop.ssh_config
  
/home/kim/bin/wallpaper.sh:
  file.managed:
    - user: kim
    - group: kim
    - mode: 0740
    - source: salt://desktop/files/wallpaper.sh

/home/kim/bin/apps.sh:
  file.managed:
    - user: kim
    - group: admins
    - mode: 0740
    - source: salt://desktop/files/apps.sh

/opt/nifty_apps.txt:
  file.managed:
    - user: root
    - group: admins
    - mode: 0665
    - source: salt://desktop/files/nifty_apps.txt

/home/kim/bin/scrot.sh:
  file.managed:
    - user: kim
    - group: admins
    - mode: 0740
    - source: salt://desktop/files/scrot.sh

/home/kim/bin/bluetooth_connect.sh:
  file.managed:
    - user: kim 
    - group: admins
    - mode: 0740
    - source: salt://desktop/files/bluetooth_connect.sh

/home/kim/bin/dmenu_handler:
  file.managed:
    - user: kim
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
/home/kim/.config/redshift/redshift.conf:
  file.managed:
    - user: kim
    - group: kim
    - mode: 0700
    - source: salt://desktop/files/redshift/redshift.conf

/home/kim/.config/redshift:
  file.directory:
    - user: kim
    - group: kim
    - mode: 0700
