# -*- coding: utf-8 -*-
# vim: ft=sls
{% for exporter, config in salt['pillar.get']('exporters', {}).items() %}
{{ exporter }}-prometheus:
  file.managed:
    - name:  {{ config.path }}/{{ exporter }} 
    - users: root
    - group: root
    - mode: "0740"
    - template: jinja
    - source: salt://prometheus-exporters/files/{{ exporter }}
    - context:
      config: {{ config|tojson }}
{% endfor %}

