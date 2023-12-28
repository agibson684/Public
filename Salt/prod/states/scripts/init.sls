include:
  - scripts.path

scripts-root:
  file.managed:
    - user: root
    - group: admins
    - mode: 750
    - names:
      - /opt/scripts/kill_samba.sh:
        - source: salt://scripts/files/kill_samba.sh
      - /opt/scripts/gunzip-log-viewer.sh:
        - source: salt://scripts/files/gunzip-log-viewer.sh
      - /opt/scripts/aptitude_upgrade.sh:
        - source: salt://scripts/files/aptitude_upgrade.sh
      - /opt/scripts/samba_stale_file.sh:
        - source: salt://scripts/files/samba_stale_file.sh
      - /opt/scripts/kill_samba.sh:
        - source: salt://scripts/files/kill_samba.sh
      - /opt/scripts/restart-pacs.sh:
        - source: salt://scripts/files/restart-pacs.sh
      - /opt/scripts/iptables_clean.sh:
        - source: salt://scripts/files/iptables_clean.sh
scripts-erin:
  file.managed:
    - user: erin
    - group: users
    - mode: 750
    - names:
      - /opt/scripts/convert-mp4-mp3.sh:  
        - source: salt://scripts/files/convert-mp4-mp3.sh 
