# Logstash Pillar
{% from "logstash/map.jinja" import logstash with context %}

logstash:
  sysconfig: salt://logstash/conf/logstash.yml
  javaconfig: salt://logstash/conf/jvm.options
  configs:
    # Input, Filter and Output configuration
    /etc/logstash/conf.d/10-input-rsyslog.conf:
      source: salt://logstash/conf.d/input-rsyslog.conf
    /etc/logstash/conf.d/20-filter-drop.conf:
      source: salt://logstash/conf.d/filter-drop.conf
    /etc/logstash/conf.d/25-filter-asa.conf:
      source: salt://logstash/conf.d/filter-asa.conf
    /etc/logstash/conf.d/30-filter-php.conf:
      source: salt://logstash/conf.d/filter-php.conf
    /etc/logstash/conf.d/40-filter-httpd.conf:
      source: salt://logstash/conf.d/filter-httpd.conf
    /etc/logstash/conf.d/45-filter-haproxy.conf:
      source: salt://logstash/conf.d/filter-haproxy.conf
    /etc/logstash/conf.d/46-filter-swith.conf:
      source: salt://logstash/conf.d/filter-switch.conf
    /etc/logstash/conf.d/50-output-all.conf:
      source: salt://logstash/conf.d/output-all-new.conf
  elasticsearch:
    host: {{ logstash.elasticsearchhost }}
