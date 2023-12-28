# HAProxy local logging ruleset

/etc/rsyslog.d/60-keepalived.conf:
  file.managed:
    - source: salt://rsyslog/conf/rsyslog.d/keepalived.local
    - user: root
    - group: root
    - template: jinja
    - require:
      - pkg: rsyslog
    - watch_in:
      - service: rsyslog
