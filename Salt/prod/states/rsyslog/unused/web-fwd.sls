# Web Rsyslog ruleset for fwding to logserver

/etc/rsyslog.d/20-web.conf:
  file.managed:
    - source: salt://rsyslog/conf/rsyslog.d/web.fwd
    - user: root
    - group: root
    - template: jinja
    - require:
      - pkg: rsyslog
    - watch_in:
      - service: rsyslog
