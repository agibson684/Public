{% if grains['os'] == 'Centos' or grains['os'] == 'Debian' or grains['os'] == 'Fedora'%}
droplet_all_packages:
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
      - sshpass
      - ca-certificates
      - cmatrix
      - libuser
      - yamllint
      - locate
      - moreutils
      
{% endif %}
{% if grains['os'] == 'Debian' %}
droplet_deb_packages:
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
      - curl 
      - net-tools
      - lsof
      - tcpdump
      - vnstat  
      - {% endif %}
{% if grains['os'] == 'Fedora' %}
fedora_packages:
  pkgs.installed:
    - pkgs:
      - linux_logo
{% endif %}
