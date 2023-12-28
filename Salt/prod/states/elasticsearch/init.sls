# Install ElasticSearch

include:
  - java.openjdk7
  - elasticsearch.repo
  - elasticsearch.curator


elasticsearch:
  pkg:
    - installed
  service.running:
    - enable: True
    - require:
      - pkg: elasticsearch
      - file: es-config
      - file: es-logging
      - file: es-sysconfig
    - watch:
      - file: es-config
      - file: es-logging
      - file: es-sysconfig


#/sbin/chkconfig --add elasticsearch:
#  cmd.run:
#    - unless: /sbin/chkconfig --list | grep -c elasticsearch
#    - require:
#      - pkg: elasticsearch


es-config:
  file.managed:
    - name: /etc/elasticsearch/elasticsearch.yml
    - source: {{ pillar["elasticsearch"]["es-conf"] }}
    - user: root
    - group: root
    - mode: 644
    - template: jinja


es-logging:
  file.managed:
    - name: /etc/elasticsearch/logging.yml
    - source: {{ pillar["elasticsearch"]["logging-conf"] }}
    - user: root
    - group: root
    - mode: 644

es-sysconfig:
  file.managed:
    - name: /etc/sysconfig/elasticsearch
    - source: {{ pillar["elasticsearch"]["es-sysconfig"] }}
    - user: root
    - group: root
    - mode: 644

{%- for file in salt["pillar.get"]("elasticsearch:plugins", []) %}
{%- set source=salt["pillar.get"]("elasticsearch:plugins:"+file+":source", []) %}
{{ file }}:
  file.managed:
    - name: {{ file }}
    - source: {{ source }}
    - makedirs: True
    - user: root
    - group: root
    - mode: 644
{%- endfor %}
