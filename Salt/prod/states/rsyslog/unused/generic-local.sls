# Generic Rsyslog ruleset for local logs

/etc/rsyslog.d/10-generic.conf:
  file.managed:
    - source: salt://rsyslog/conf/rsyslog.d/generic.local
    - user: root
    - group: root
    - template: jinja
    - require:
      - pkg: rsyslog
    - watch_in:
      - service: rsyslog
