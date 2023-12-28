prometheus:
  group.present
/etc/prometheus:
  file.directory:
    - users: root
    - group: prometheus
    - mode: "0750"
exporter-config:
  file.managed:
    - name:  {{ pillar["config"] }} 
    - users: root
    - group: prometheus
    - mode: "0750"
    - template: jinja
    - source: salt://prometheus-exporters/files{{ pillar["config"] }}

