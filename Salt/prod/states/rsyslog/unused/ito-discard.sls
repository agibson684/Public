# ITO stop logging rules before they make it to local message logs or get forwarded via local5

/etc/rsyslog.d/05-ito.conf:
  file.managed:
    - source: salt://rsyslog/conf/rsyslog.d/ito.discard
    - user: root
    - group: root
    - template: jinja
    - require:
      - pkg: rsyslog
    - watch_in:
      - service: rsyslog
