shaarli-dir:
  file.directory:
  user: www-data
  group: www-data
  mode: 664 
  - names:
    - /usr/share/shaarli:
      - source: salt://apache/shaarli
 - require:
    service: apache2
    
shaarli-cache:
  file.managed:
  user: www-data
  group: www-data
  mode: 770
  - names:
    - /usr/share/shaarli/shaarli.conf:
      - source: salt://apache/shaarli/shaarli.conf
 - require:
    service: apache2


