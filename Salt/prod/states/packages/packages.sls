{% if grains['os'] == 'Centos' or grains['os'] == 'Debian' or grains['os'] == 'Fedora'%}
all_packages:
  pkg.installed:
    - pkgs:
      - bash
      - figlet
      - autossh
      - links
      - tar 
      - bzip2
      - diffutils
      - colordiff
      - nano 
      - unzip 
      - rsync
      - mc
      - acpi 
      - git
      - ntpdate
      - cmatrix
      - smartmontools
      - curl
#      - glances
      - sshpass
      - ca-certificates
      - libuser
      - yamllint
      - locate
      - moreutils
      
{% endif %}
{% if grains['os'] == 'Debian' %}
deb_packages:
  pkg.installed:
    - pkgs:
      - aptitude
      - linuxlogo
      - rar
      - apt-show-versions
      - needrestart
      - debian-keyring
      - vim-nox
      - lm-sensors
      - lolcat
      - apt-transport-https
      - python3-pip
      - safe-rm
      - iftop 
      - dnstop
      - ethtool
      - net-tools
      - lsof
      - tcpdump
      - vnstat  
      - network-manager-gnome 
      - network-manager-openconnect-gnome 
      - network-manager-openvpn-gnome 
      - network-manager-vpnc-gnome 
      - network-manager-pptp-gnome
{% endif %}
{% if grains['roles'] == 'zfs'  %}
zfs_packages:
  pkg.installed:
    - pkgs:
      - zfs-auto-snapshot
      - zfs-dkms
{% endif %}
{% if grains['os'] == 'Fedora' %}
fedora_packages:
  pkgs.installed:
    - pkgs:
      - linux_logo
{% endif %}
