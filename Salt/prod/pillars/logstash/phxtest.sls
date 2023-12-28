# Logstash Pillar
{% from "logstash/map.jinja" import logstash with context %}

logstash:
  sysconfig: salt://logstash/conf/sysconfig-logstash
  configs:
    # Input, Filter and Output configuration
    /etc/logstash/conf.d/10-input-rsyslog.conf:
      source: salt://logstash/conf.d/input-rsyslog.conf
    /etc/logstash/conf.d/20-filter-drop.conf:
      source: salt://logstash/conf.d/filter-drop.conf
    /etc/logstash/conf.d/30-filter-php.conf:
      source: salt://logstash/conf.d/filter-php.conf
    /etc/logstash/conf.d/40-filter-httpd.conf:
      source: salt://logstash/conf.d/filter-httpd.conf
    /etc/logstash/conf.d/50-output-all.conf:
      source: salt://logstash/conf.d/output-all-phxtest.conf
  elasticsearch:
    host1: {{ logstash.elasticsearchhost1 }}
    host2: {{ logstash.elasticsearchhost2 }}

