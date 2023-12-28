{% for bbackup_type, config in salt['pillar.get']('bbackup_types', {}).items() %}
backupscript-{{ bbackup_type }}:
  file.managed:
    - name:  {{ config.path }}/backup.{{ bbackup_type }}.sh
    - users: root
    - group: root
    - mode: "0740"
    - template: jinja
    - source: salt://backup/files/bbackup.sh
    - context:
      config: {{ config|tojson }}
{% endfor %}

