
include:
  - prometheus
  - systemd

/etc/prometheus/alertmanager/:
  file.directory:
    - user: prometheus
    - group: prometheus
    - mode: '0770'
    - dir_mode: '0770'
    - makedirs: True
    - require:
      - pkg: prometheus
/etc/prometheus/alertmanager/alertmanager.yml:
  file.managed:
    - user: prometheus
    - group: prometheus
    - mode: '0770'
    - dir_mode: '0770'
    - makedirs: True
    - template: jinja
    - require:
      - pkg: prometheus
    - source: {{ pillar["prometheus"]["alertmanager_yml"] }}
/etc/prometheus/alertmanager/alertmanager:
  file.managed:
    - user: prometheus
    - group: prometheus
    - mode: '0770'
    - dir_mode: '0770'
    - makedirs: True
    - template: jinja
    - require:
      - pkg: prometheus
    - source: {{ pillar["prometheus"]["alertmanager_binary"] }}

#dont try to use template jinja here i got errors 
/etc/prometheus/rules.yml:
  file.managed:
    - user: prometheus
    - group: prometheus
    - mode: '0750'
    - makedirs: True
    - source: {{ pillar["prometheus"]["rules"] }}
prometheus-alertmanager:
  service.running:
    - enable: True
    - reload: False
    - watch:
      - file: /etc/prometheus/alertmanager/
      - file: /etc/prometheus/rules.yml

