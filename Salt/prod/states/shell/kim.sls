{%- if salt["grains.get"]("host", "") == "m0m*" %}
/home/kim:
  file.symlink:
    - users: kim
    - group: admins
    - mode: "0700"
    - target: /home/THRACE/kim
    - require:
      - sls: shell.groups
{% else %}
/home/kim:
  file.directory:
    - users: kim
    - group: admins
    - mode: "0700"
    - target: /home/THRACE/kim
{% endif %}


kim:
  user.present:
    - fullname: kim sims
    - shell: /bin/bash
    - groups:
      - cdrom 
      - floppy
      - audio
      - dip
      - video
      - plugdev
      - scanner
      - bluetooth
      - netdev 
    - require:
      - sls: shell.groups
/home/kim/bin/:
  file.directory:
    - users: kim
    - group: admins
    - mode: "0700"
    - target: /home/THRACE/kim/bin
/home/kim/.bashrc:
  file.managed:
    - users: kim
    - group: admins
    - mode: "0600"
    - source: salt://shell/files/bashrc.redfox
    - require:
      - sls: shell.groups
/home/kim/.dir_colors:
  file.managed:
    - users: kim
    - group: admins
    - mode: "0600"
    - source: salt://shell/files/.dir_colors.redfox

/home/kim/.Xdefaults:
  file.managed:
    - user: kim
    - group: admins
    - mode:  "0600"
    - source: salt://shell/files/.Xdefaults.redfox
/home/kim/.profile:
  file.managed:
    - users: kim
    - group: kim
    - mode: "0600"
    - source: salt://shell/files/.profile

