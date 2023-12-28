  # Rsyslog Pillar
{% from "rsyslog/map.jinja" import rsyslog with context %}

rsyslog:
 conf: salt://rsyslog/conf/rsyslog-new.conf
 serverip: {{ rsyslog.ip }}
 serverport: {{ rsyslog.port }}
 protocol: {{ rsyslog.protocol }}

