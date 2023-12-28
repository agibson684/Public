sysstat:
  pkg:
    - installed

/etc/default/sysstat:
  file.managed:
    - users: root
    - group: root
    - mode: "0600"
    - template: jinja
    - require:
      - pkg: sysstat
    - source: salt://sysstat/files/sysstat
