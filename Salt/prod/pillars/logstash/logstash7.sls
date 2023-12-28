# Logstash Pillar
{% from "logstash/map7.jinja" import logstash with context %}

logstash:
  sysconfig: salt://logstash/conf/logstash.yml
  javaconfig: salt://logstash/conf/jvm.options
  pipelines: salt://logstash/conf/pipelines.yml
  configs:
    # Input, Filter and Output configuration
    /etc/logstash/conf.d/10-input-rsyslog.conf:
      source: salt://logstash/conf7.d/input-rsyslog.conf

    /etc/logstash/conf.d/20-filter-drop.conf:
      source: salt://logstash/conf7.d/filter-drop.conf
#    /etc/logstash/conf.d/30-filter-pfsense.conf:
#      source: salt://logstash/conf7.d/filter-pfsense.conf

#    /etc/logstash/conf.d/25-filter-asa.conf:
#      source: salt://logstash/conf7.d/filter-asa.conf

#    /etc/logstash/conf.d/30-filter-php.conf:
#      source: salt://logstash/conf7.d/filter-php.conf

    /etc/logstash/conf.d/40-filter-httpd.conf:
      source: salt://logstash/conf7.d/filter-httpd.conf

#    /etc/logstash/conf.d/45-filter-haproxy.conf:
#      source: salt://logstash/conf7.d/filter-haproxy.conf

#    /etc/logstash/conf.d/46-filter-switch.conf:
#      source: salt://logstash/conf7.d/filter-switch.conf

    /etc/logstash/conf.d/47-filter-systemd.conf:
      source: salt://logstash/conf7.d/filter-systemd.conf

    /etc/logstash/conf.d/48-filter-elasticsearch.conf:
      source: salt://logstash/conf7.d/filter-elasticsearch.conf

    /etc/logstash/conf.d/49-filter-kibana.conf:
      source: salt://logstash/conf7.d/filter-kibana.conf

    /etc/logstash/conf.d/50-filter-logstash.conf:
      source: salt://logstash/conf7.d/filter-logstash.conf

    /etc/logstash/conf.d/51-output-all.conf:
      source: salt://logstash/conf7.d/output-all.conf

  elasticsearch:
    host: {{ logstash.elasticsearchhost }} 

