scripts-remote:
  file.managed:
    - user: root
    - group: admins
    - mode: 750
    - template: jinja
    - names:
#this remote is old i think 
#      - /opt/scripts/pull-backups-remote.sh:
#        - source: salt://scripts/files/pull-backups-remote.sh
      - /opt/scripts/weather.py:
        - source: salt://scripts/files/weather.py
      - /opt/scripts/weather.config:
        - source: salt://scripts/files/weather.config
      - /opt/scripts/cli-salt.sh:
        - source: salt://scripts/files/cli-salt.sh
