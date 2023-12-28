# Mysql  Rsyslog ruleset for fwding to logserver

/etc/rsyslog.d/80-mysql.conf:
  file.managed:
    - source: salt://rsyslog/conf/rsyslog.d/mysql.fwd
    - user: root
    - group: root
    - template: jinja
    - require:
      - pkg: rsyslog
    - watch_in:
      - service: rsyslog
