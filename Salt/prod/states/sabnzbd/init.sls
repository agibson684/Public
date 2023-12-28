sabnzbdplus:
  service:
    - name: sabnzbdplus
    - running
    - Enable: True
  pkg:
    - installed
  user:
    - present
/home/sabnzbdplus:
  file.directory:
    - user: sabnzbdplus
    - group: sabnzbdplus
    - dir_mode: "0750" 
    - file_mode: "0750"
    - require:
      - pkg: sabnzbdplus
/etc/default/sabnzbdplus:
  file.managed:
    - users: root
    - group: root
    - mode: "0750"
    - template: jinja
    - require:
      - pkg: sabnzbdplus
    - source: salt://sabnzbd/files/default/sabnzbdplus
/home/sabnzbdplus/sabnzbd.ini:
  file.managed:
    - users: sabnzbdplus
    - group: sabnzbdplus
    - mode: "0750"
    - template: jinja
    - require:
      - pkg: sabnzbdplus
    - source: salt://sabnzbd/files/sabnzbd.ini

