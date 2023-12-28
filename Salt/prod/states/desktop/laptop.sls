xl2pd:
  service.disabled

{% if grains['os'] == 'Debian' or grains['os'] == 'Fedora' %}
osspecfic_packages:
  pkg.installed:
    - pkgs:
      - powermanga
      - alsamixergui
      - firefox-esr
      - xscreensaver-data-extra
      - xscreensaver-gl-extra
      - icedtea-netx
      - wakeonlan
      - keepassx
      - suckless-tools
      - taskwarrior
      - slurm
      - silversearcher-ag
      - libudev-dev
      - build-essential
      - zlib1g-dev
      - xdaliclock
      - redshift
      - rox-filer
      - firmware-brcm80211
      - dbus-x11
      - libreoffice
      - tilix
      - i3
      - quassel-client
{% endif %} 
laptop_packages:
  pkg.installed:
    - pkgs:
      - tlp
      - htop
      - glances
      - xscreensaver
      - udiskie
      - xcompmgr
      - mplayer
      - guake
      - nautilus
      - mencoder
      - terminator
      - ethtool
      - transmission-qt
      - trayer
      - unison
      - powertop
      - calcurse
      - feh 
      - sshfs
      - gparted
      - mosh
      - tig
      - gpicview
      - nmap
      - cantata
      - sipcalc
      - mtr
      - openconnect
      - jq  
include:
  - desktop.path
  - desktop.logind
  - desktop.ssh_config

/home/erin/bin/wallpaper.sh:
  file.managed:
    - user: erin
    - group: admins
    - mode: "0775"
    - source: salt://desktop/files/wallpaper.sh

/home/erin/bin/apps.sh:
  file.managed:
    - user: erin
    - group: admins
    - mode: "0775"
    - source: salt://desktop/files/apps.sh

/opt/nifty_apps.txt:
  file.managed:
    - user: root
    - group: admins
    - mode: "0665"
    - source: salt://desktop/files/nifty_apps.txt

/home/erin/bin/switch_screen_output.sh:
  file.managed:
    - user: erin
    - group: admins
    - mode: "0775"
    - source: salt://desktop/files/switch_screen_output.sh

/home/erin/bin/switch_audio_output.sh:
  file.managed:
    - user: erin
    - group: admins
    - mode: "0775"
    - source: salt://desktop/files/switch_audio_output.sh
/home/erin/.xmonad/xmonad-start:
  file.managed:
    - user: erin
    - group: admins
    - mode: "0775"
    - source: salt://desktop/files/start-laptop
/usr/sbin/xmonad-start:
  file.symlink:
    - user: erin
    - group: admins
    - mode: "0775"
    - target: /home/erin/.xmonad/xmonad-start

/usr/share/xsessions/xmonad.desktop:
  file.managed:
    - user: erin
    - group: admins
    - mode: "0775"
    - source: salt://desktop/files/xmonad.desktop
/home/erin/.xmonad/xmonad.hs:
  file.managed:
    - user: erin
    - group: admins
    - mode: "0775"
    - source: salt:///desktop/files/xmonad.hs
/home/erin/bin/mount-sshfs.sh:
  file.managed:
    - user: erin
    - group: admins
    - mode: "0775"
    - source: salt://desktop/files/mount-sshfs.sh
/home/erin/bin/libreoffice.sh:
  file.managed:
    - user: erin
    - group: admins
    - mode: "0775"
    - source: salt://desktop/files/libreoffice.sh
/srv/keepassx:
  file.directory:
    - user: erin
    - group: admins
    - mode: "0775"
/home/erin/bin/magnet:
  file.managed:
    - user: erin
    - group: admins
    - mode: "0775"
    - source: salt://desktop/files/magnet
/home/erin/.xmobarrc:
  file.managed:
    - user: erin
    - group: admins
    - mode: "0775"
    - source: salt://desktop/files/.xmobarrc
/home/erin/.xscreensaver:
  file.managed:
    - user: erin
    - group: admins
    - mode: "0775"
    - source: salt://desktop/files/.xscreensaver
/home/erin/.kodi:
  file.symlink:
    - user: erin
    - group: admins
    - mode: "0775"
    - target: /srv/.kodi
/home/THRACE/erin/.config:
  file.directory:
    - user: erin
    - group: admins
    - mode: "0755"
/home/THRACE/erin/.config/i3:
  file.directory:
    - user: erin
    - group: erin
    - mode: "0766"
/home/THRACE/erin/.config/i3/config:
  file.managed:
    - source: salt://desktop/files/{{ salt['pillar.get']('desktop:i3-laptop:config') }}
    - user: erin
    - group: erin
    - mode: "0777"
/home/THRACE/erin/.config/quassel.irc.org:
  file.directory:
    - user: erin
    - mode: "0777"
    - group: erin
/home/THRACE/erin/.config/quassel.irc.org/gabydewilde-black.qss:
  file.managed:
    - user: erin
    - mode: "0777"
    - group: erin
    - source: salt://desktop/files/gabydewilde-black.qss
/etc/slim.conf:
  file.managed:
    - user: erin
    - mode: "0777"
    - group: erin
    - source: salt://desktop/files/slim-laptop.conf
