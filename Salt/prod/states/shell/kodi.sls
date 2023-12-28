kodi-user:
  user.present:
    - name: kodi
    - fullname: kodi
    - shell: /bin/bash
    - groups:
      - kodi
      - floppy
      - audio
      - video
      - plugdev
      - netdev 
kodi-grp:
  group.present:
    - name: kodi
