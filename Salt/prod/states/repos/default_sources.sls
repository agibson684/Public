{% if 'Debian' in salt['grains.get']('os') %} 
{% if 'bookworm'  in salt['grains.get']('oscodename') %} 
debian-main:
  pkgrepo.managed:
    - name: 'deb http://deb.debian.org/debian/ {{ grains['oscodename'] }} main contrib '
    - humanname: debian-org
    - file:  /etc/apt/sources.list.d/http_debian.list
debian-updates:
  pkgrepo.managed:
    - name: 'deb http://ftp.debian.org/debian/ {{ grains['oscodename'] }}-updates main contrib'
    - humanname: debian-org-updates
    - file:  /etc/apt/sources.list.d/http_debian_updates.list
{% elif 'bullseye'  in salt['grains.get']('oscodename') %} 
debian-main:
  pkgrepo.managed:
    - name: 'deb http://deb.debian.org/debian/ {{ grains['oscodename'] }} main contrib non-free'
    - humanname: debian-org
    - file:  /etc/apt/sources.list.d/http_debian.list
debian-updates:
  pkgrepo.managed:
    - name: 'deb http://ftp.debian.org/debian/ {{ grains['oscodename'] }}-updates main contrib non-free'
    - humanname: debian-org-updates
    - file:  /etc/apt/sources.list.d/http_debian_updates.list
{% endif %}
{% if 'bullseye'  in salt['grains.get']('oscodename') %} 
debian-security:
  pkgrepo.managed:
    - name: 'deb http://deb.debian.org/debian-security {{ grains['oscodename'] }}-security main'
    - humanname: debian-org-security
    - file:  /etc/apt/sources.list.d/http_debian_security.list
{% elif 'buster' in salt['grains.get']('oscodename') %} 
debian-security:
  pkgrepo.managed:
    - name: 'deb http://deb.debian.org/debian-security {{ grains['oscodename'] }}/updates main'
    - humanname: debian-org-security
    - file:  /etc/apt/sources.list.d/http_debian_security.list
{% endif %}
debian-backports:
  pkgrepo.managed:
    - name: 'deb http://ftp.debian.org/debian/ {{ grains['oscodename'] }}-backports main'
    - humanname: debian-org-backports
    - file:  /etc/apt/sources.list.d/http_debian_backports.list
{% if 'bullseye' in salt['grains.get']('oscodename') %} 
debian-multimedia:
  pkgrepo.absent:
    - name: 'deb http://www.deb-multimedia.org stable main non-free'
    - humanname: debian-multimedia
    - file:  /etc/apt/sources.list.d/debian-multimedia.list
{% elif 'buster' in salt['grains.get']('oscodename') %} 
debian-multimedia:
  pkgrepo.absent:
    - name: 'deb http://www.deb-multimedia.org buster main non-free'
    - humanname: debian-multimedia
    - file:  /etc/apt/sources.list.d/debian-multimedia.list
{% elif 'bookworm' in salt['grains.get']('oscodename') %} 
debian-multimedia:
  pkgrepo.absent:
    - name: 'deb http://www.deb-multimedia.org bookworm  main non-free'
    - humanname: debian-multimedia
    - file:  /etc/apt/sources.list.d/debian-multimedia.list
{% endif %}
{% endif %}

