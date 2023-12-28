file-{{ pillar['service']['servicename'] }}:
  file.managed:
    - name: /etc/systemd/system/{{ pillar["service"]["servicename"] }}.service
    - users: root
    - group: root
    - mode: "0740"
    - template: jinja
    - source: salt://systemd/services/service.service

# Reload Service on change
{{ pillar['service']['servicename'] }}-systemd-reload:
  cmd.wait:
    - name: systemctl daemon-reload
    - user: root
    - watch:
      - file: file-{{ pillar['service']['servicename'] }}

# Enable Service
{{ pillar['service']['servicename'] }}:
  service.enabled:
    - name: {{ pillar['service']['servicename'] }}.service
    - require:
      - file: file-{{pillar['service']['servicename'] }}
      - cmd: {{ pillar['service']['servicename'] }}-systemd-reload

