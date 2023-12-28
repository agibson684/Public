{%- if salt["grains.get"]("host", "") == "terreis" %}
/home/erin:
  file.symlink:
    - users: erin
    - group: admins
    - mode: "0700"
    - target: /home/THRACE/erin
    - require:
      - sls: groups
{% else %}
/home/erin:
  file.directory:
    - users: erin
    - group: admins
    - mode: "0700"
    - target: /home/THRACE/erin
{% endif %}
{%- if salt["grains.get"]("host", "") == "terreis" %}
erin:
  user.present:
    - fullname: Erin Sims
    - shell: /bin/bash
    - password: '$6$0ZAVjVEwxCb3cnAA$s4Egd0FV..WZ8bU2yqm.c/8ZNcdvYQygkP3KPch8zQ0kEg3hBYQDhZyjQmcmfDJJ8iam8Yf19lWEzUvARYTYb.' 
    - groups:
      - admins
      - NoPasswd
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
      - sls: shell.desktop_groups

{%- elif salt ["grains.get"] ("roles", "") == "server" %} 
erin:
  user.present:
    - fullname: Erin Sims
    - shell: /bin/bash
    - groups:
      - admins
      - NoPasswd
    - password: '$6$0ZAVjVEwxCb3cnAA$s4Egd0FV..WZ8bU2yqm.c/8ZNcdvYQygkP3KPch8zQ0kEg3hBYQDhZyjQmcmfDJJ8iam8Yf19lWEzUvARYTYb.'
    - require:
      - sls: shell.groups
{%- elif salt ["grains.get"] ("host", "") == "kodi" or salt ["grains.get"] ("host", "") == "mediacenter" %} 
erin:
  user.present:
    - fullname: Erin Sims
    - shell: /bin/bash
    - groups:
      - admins
    - password: '$6$6v1rK5LgwivRt2le$NPcW370ZL0ve7eEnjHp5VduT0gyYMTIJx4pireLOgo5Y/A9/OKuSWWRPurMu1GaF/SVIiGIL7C0mKB2CejdMR/'
    - require:
      - sls: shell.groups
{%- elif salt ["grains.get"] ("host", "") == "cyane" or salt ["grains.get"] ("host", "") == "hippolyta" or salt ["grains.get"] ("host", "") == "ephiny" %} 
erin:
  user.present:
    - fullname: Erin Sims
    - shell: /bin/bash
    - groups:
      - admins
    - password: '$6$0ZPcu3Evgt23SNHN$gGUy25eA91UqbwQ5vdlxU4L767grZGdUIloFQsXwp4wWEWkkHvxiZo4eVCSD8FPfrc3KNjlaexWnVQebGtE15/'
    - require:
      - sls: shell.groups
{% endif %}
/home/erin/bin/:
  file.directory:
    - users: erin
    - group: admins
    - mode: "0700"
    - target: /home/THRACE/erin/bin
themis:
  user.absent
/home/erin/.bashrc:
  file.managed:
    - users: erin
    - group: admins
    - mode: "0600"
    - source: salt://shell/files/bashrc
    - require:
      - sls: shell.groups
/home/erin/.dir_colors:
  file.managed:
    - users: erin
    - group: admins
    - mode: "0600"
    - source: salt://shell/files/.dir_colors

/home/erin/.Xdefaults:
  file.managed:
    - user: erin
    - group: admins
    - mode:  "0600"
    - source: salt://shell/files/.Xdefaults

