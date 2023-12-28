# Rsyslog Server

rsyslog-pkg:
  pkg:
    - name: rsyslog
    - installed

rsyslog-config:
  file.managed:
    - name: /etc/rsyslog.conf
    - source: {{ pillar["rsyslog"]["source"] }}
    - require:
      - pkg: rsyslog

rsyslog:
  service:
    - running
    - enable: True
    - watch:
      - file: rsyslog-config
    - require:
      - pkg: rsyslog
      - file: rsyslog-config

/var/spool/rsyslog:
  file.directory:
    - user: root 
    - group: root
    - mode: 750
    - makedirs: True
    - require:
      - pkg: rsyslog
