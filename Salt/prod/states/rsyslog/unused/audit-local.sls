# Auditd local logging ruleset

/etc/rsyslog.d/40-audit.conf:
  file.managed:
    - source: salt://rsyslog/conf/rsyslog.d/audit.local
    - user: root
    - group: root
    - template: jinja
    - require:
      - pkg: rsyslog
    - watch_in:
      - service: rsyslog
