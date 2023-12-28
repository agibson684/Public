elasticsearch:
  es-conf: salt://elasticsearch/conf/elasticsearch.yml
  es-conf5: salt://elasticsearch/conf/elasticsearch5.yml
  es-conf7: salt://elasticsearch/conf/elasticsearch7.yml
  es-sysconfig: salt://elasticsearch/conf/elasticsearch
  es-sysconfig5: salt://elasticsearch/conf/elasticsearch5
  es-sysconfig7: salt://elasticsearch/conf/elasticsearch7
  logging-conf: salt://elasticsearch/conf/logging.yml
  logging-conf5: salt://elasticsearch/conf/log4j2.properties
  es-javaconf: salt://elasticsearch/conf/jvm.options
  logstash:
  {%- if salt["grains.get"]("datacenter", "") == "phx" %}
    host: 172.24.1.80
  {%- elif salt["grains.get"]("datacenter", "") == "ewr" %}
    host: 172.20.1.80
  {%- elif salt["grains.get"]("datacenter", "") == "mco" %}
    host: 172.19.1.47
  {%- elif salt["grains.get"]("datacenter", "") == "ism" %}
    host: 172.26.1.80
  {%- elif salt["grains.get"]("datacenter", "") == "testing" %}
    host: 192.168.33.3
  {%- endif %}
  plugins:
    /usr/share/elasticsearch/plugins/readonlyrest/readonlyrest-1.3.jar:
      source: salt://elasticsearch/plugins/readonlyrest-1.3.jar
  plugins5:
    /usr/share/elasticsearch/plugins/readonlyrest/guava-20.0.jar:
      source: salt://elasticsearch/plugins/guava-20.0.jar
    /usr/share/elasticsearch/plugins/readonlyrest/netty-buffer-4.1.6.Final.jar:
      source: salt://elasticsearch/plugins/netty-buffer-4.1.6.Final.jar
    /usr/share/elasticsearch/plugins/readonlyrest/netty-codec-4.1.6.Final.jar:
      source: salt://elasticsearch/plugins/netty-codec-4.1.6.Final.jar
    /usr/share/elasticsearch/plugins/readonlyrest/netty-codec-http-4.1.6.Final.jar:
      source: salt://elasticsearch/plugins/netty-codec-http-4.1.6.Final.jar
    /usr/share/elasticsearch/plugins/readonlyrest/netty-common-4.1.6.Final.jar:
      source: salt://elasticsearch/plugins/netty-common-4.1.6.Final.jar
    /usr/share/elasticsearch/plugins/readonlyrest/netty-handler-4.1.6.Final.jar:
      source: salt://elasticsearch/plugins/netty-handler-4.1.6.Final.jar
    /usr/share/elasticsearch/plugins/readonlyrest/netty-resolver-4.1.6.Final.jar:
      source: salt://elasticsearch/plugins/netty-resolver-4.1.6.Final.jar
    /usr/share/elasticsearch/plugins/readonlyrest/netty-transport-4.1.6.Final.jar:
      source: salt://elasticsearch/plugins/netty-transport-4.1.6.Final.jar
    /usr/share/elasticsearch/plugins/readonlyrest/readonlyrest-1.13.0_es5.1.2.jar:
      source: salt://elasticsearch/plugins/readonlyrest-1.13.0_es5.1.2.jar
    /usr/share/elasticsearch/plugins/readonlyrest/transport-netty4-client-5.1.2.jar:
      source: salt://elasticsearch/plugins/transport-netty4-client-5.1.2.jar
    /usr/share/elasticsearch/plugins/readonlyrest/plugin-descriptor.properties:
      source: salt://elasticsearch/plugins/plugin-descriptor.properties
    /usr/share/elasticsearch/plugins/readonlyrest/plugin-security.policy:
      source: salt://elasticsearch/plugins/plugin-security.policy
