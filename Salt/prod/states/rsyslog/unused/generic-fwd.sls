# Generic Rsyslog ruleset for fwding to logserver

/etc/rsyslog.d/10-generic.conf:
  file.managed:
    - source: salt://rsyslog/conf/rsyslog.d/generic.fwd
    - user: root
    - group: root
    - template: jinja
    - require:
      - pkg: rsyslog
    - watch_in:
      - service: rsyslog
