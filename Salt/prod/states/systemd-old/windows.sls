{% for mount_type, config in salt['pillar.get']('windows', {}).items() %}
file-{{ mount_type }}:
  file.managed:
    - name:  /etc/systemd/system/{{ mount_type }}.mount
    - users: root
    - group: root
    - mode: "0740"
    - template: jinja
    - source: salt://systemd/services/mount.service
    - context:
        config: {{ config|tojson }}

# Reload Service on change
{{ mount_type }}-systemd-reload:
  cmd.wait:
    - name: systemctl daemon-reload
    - user: root
    - watch:
      - file: file-{{ mount_type }}

# Enable Service
{{ mount_type }}:
  service.enabled:
    - name: {{ mount_type }}.mount
    - require:
      - file: file-{{ mount_type }}
      - cmd: {{ mount_type }}-systemd-reload

{% endfor %}
