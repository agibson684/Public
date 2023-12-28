logrotate:
  pkg:
    - installed

/etc/logrotate.d:
  file.directory:
    - user: root
    - group: root
    - dir_mode: "0644" 
    - file_mode: "0644"
    - require:
      - pkg: logrotate
/etc/logrotate.conf:
  file.managed:
    - users: root
    - group: root
    - mode: "0644"
    - template: jinja
    - require:
      - pkg: logrotate
    - source: salt://logrotate/files/logrotate.conf
