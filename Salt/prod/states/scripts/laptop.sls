scripts-laptop:
  file.managed:
    - user: erin
    - group: erin
    - mode: 500
    - template: jinja
    - names:
        - /opt/scripts/rsync-playlist-usbdisk.sh:
          - source: salt://scripts/files/rsync-playlist-usbdisk.sh
        - /opt/scripts/release-bump.sh:
          - source: salt://scripts/files/release-bump.sh
        - /opt/scripts/feature.sh:
          - source: salt://scripts/files/feature.sh
        - /opt/scripts/battery.sh:
          - source: salt://scripts/files/battery.sh
        - /opt/scripts/cli-salt.sh:
          - source: salt://scripts/files/cli-salt.sh
