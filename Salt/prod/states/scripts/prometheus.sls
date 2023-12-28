scripts-prometheus:
  file.recurse:
    - name: /usr/share/prometheus-node-exporter-collectors
    - user: root
    - group: root
    - dir_mode: 755
    - file_mode: 755
    - source: salt://scripts/files/prometheus-node-exporter-collectors
    - require:
      - file: scripts-prometheus-node-exporter
      - file: script-prometheus-directory
  

scripts-prometheus-node-exporter:
  file.directory:
    - name: /var/lib/prometheus/node-exporter/
    - user: root
    - group: root
    - dir_mode: 755 
    - file_mode: 755
    - require:
      - file: script-prometheus-directory
    - recurse:
      - user
      - group
      - mode 
script-prometheus-directory:
  file.directory:
    - name: /var/lib/prometheus
    - user: root
    - group: root
    - dir_mode: 751
    - file_mode: 751
