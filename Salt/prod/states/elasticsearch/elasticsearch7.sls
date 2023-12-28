# Install ElasticSearch
include:
  - repos.elk7
  - java.openjdk8
  - repos.adoptopenjdk

elasticsearch:
  pkg:
    - installed
  service.running:
    - require:
      - pkg: elasticsearch
      - file: es-config
      - file: es-javaconfig
    - watch:
      - file: es-config
      - file: es-javaconfig

es-config:
  file.managed:
    - name: /etc/elasticsearch/elasticsearch.yml
    - source: salt://elasticsearch/conf/elasticsearch7.yml
    - user: root
    - group: root
    - mode: 644
    - template: jinja

es-javaconfig:
  file.managed:
    - name: /etc/elasticsearch/jvm.options
    - source: salt://elasticsearch/conf/jvm.options7
    - user: root
    - group: root
    - mode: 644
