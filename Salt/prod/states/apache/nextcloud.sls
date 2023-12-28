nextcloud-dir:
  file.directory:
  user: www-data
  group: www-data
  mode: 664 
  - names:
    - /usr/share/nextcloud:
      - source: salt://apache/nextcloud
 - require:
    service: apache2

nextcloud-cache:
  file.directory:
  user: www-data
  group: www-data
  mode: 770
  - names:
    - /usr/share/netcloud/cache:
      - source: salt://apache/nexcloud/cache
 - require:
    service: apache2


