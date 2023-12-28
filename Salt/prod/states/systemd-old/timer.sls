{% for timer_type, config in salt['pillar.get']('timer_types', {}).items() %}
file-{{ timer_type }}-timer:
  file.managed:
    - name:  /etc/systemd/system/{{ timer_type }}.timer
    - users: root
    - group: root
    - mode: "0444"
    - template: jinja
    - source: salt://systemd/services/timer.service
    - context:
        config: {{ config|tojson }}

# Reload Service on change
{{ timer_type }}-systemd-reload-timer:
  cmd.wait:
    - name: systemctl daemon-reload
    - user: root
    - watch:
      - file: file-{{ timer_type }}-timer

# Enable Service
{{ timer_type }}-timer:
  service.enabled:
    - name: {{ timer_type }}.timer
    - require:
      - file: file-{{ timer_type }}-timer
      - cmd: {{ timer_type }}-systemd-reload-timer

{% endfor %}
