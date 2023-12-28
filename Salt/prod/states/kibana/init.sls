# Install Kibana

kibana:
  pkg:
    - installed
  service.running:
    - enable: True
    - require:
      - pkg: kibana
      - file: kibanaconf
    - watch:
      - file: kibanaconf

kibanaconf:
  file.managed:
    - name: /etc/kibana/kibana.yml
    - source: salt://kibana/conf/kibana.yml
    - user: root
    - group: root
    - mode: 644

