sudo:
  pkg:
    - installed

/etc/sudoers.d:
  file.directory:
    - user: root
    - group: root
    - dir_mode: "0750" 
    - file_mode: "0440"
    - require:
      - pkg: sudo
/etc/sudoers:
  file.managed:
    - users: root
    - group: root
    - mode: "0440"
    - check_cmd: /usr/sbin/visudo -c -f
    - template: jinja
    - require:
      - pkg: sudo
    - source: salt://sudo/files/sudoers

/etc/sudoers.d/apt:
  file.managed:
    - users: root
    - group: root
    - mode: "0440"
    - check_cmd: /usr/sbin/visudo -c -f
    - source: salt://sudo/files/apt
 
/etc/sudoers.d/tools:
  file.managed:
    - users: root
    - group: root
    - mode: "0440"
    - check_cmd: /usr/sbin/visudo -c -f
    - source: salt://sudo/files/tools

/etc/sudoers.d/services:
  file.managed:
    - users: root
    - group: root
    - mode: "0440"
    - check_cmd: /usr/sbin/visudo -c -f
    - source: salt://sudo/files/services


/etc/sudoers.d/desktop:
  file.managed:
    - users: root
    - group: root
    - mode: "0440"
    - check_cmd: /usr/sbin/visudo -c -f
    - source: salt://sudo/files/desktop

/etc/sudoers.d/scripts:
  file.managed:
    - users: root
    - group: root
    - mode: "0440"
    - check_cmd: /usr/sbin/visudo -c -f
    - source: salt://sudo/files/scripts

/etc/sudoers.d/nagios:
  file.managed:
    - users: root
    - group: root
    - mode: "0440"
    - check_cmd: /usr/sbin/visudo -c -f
    - source: salt://sudo/files/nagios

/etc/sudoers.d/files:
  file.managed:
    - users: root
    - group: root
    - mode: "0440"
    - check_cmd: /usr/sbin/visudo -c -f
    - source: salt://sudo/files/files

