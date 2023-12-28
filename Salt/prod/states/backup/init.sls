{% for backup_type, config in salt['pillar.get']('backup_types', {}).items() %}
backupscript-{{ backup_type }}:
  file.managed:
    - name:  {{ config.path }}/backup.{{ backup_type }}.sh
    - users: root
    - group: root
    - mode: "0740"
    - template: jinja
    - source: salt://backup/files/backup.sh
    - context:
      config: {{ config|tojson }}
{% endfor %}
exclude-{{ pillar['backup_types']['day']['exclude'] }}:
  file.managed:
    - name: /opt/scripts/{{ pillar['backup_types']['day']['exclude'] }}
    - users: root
    - group: root 
    - mode: "0740"
    - source: salt://backup/files/exclude.txt 
/opt/scripts/pull-backups-remote.sh:
   file.managed:
    - users: root
    - group: root
    - mode: "0740"
    - template: jinja
    - source: salt://backup/files/pull-backups-remote.sh
/media/backup/{{ grains['host'] }}:
  file.directory:
    - users: root
    - group: root
    - mode: "0755"

