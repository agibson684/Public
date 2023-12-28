/bin/systemctl:
  file.managed:
    - mode: '0771'
    - user: root
    - group: root
/usr/bin/ls_colors_generator:
  file.managed:
    - mode: '0777'
    - user: root
    - group: root
    - source: salt://shell/files/ls_colors_generator

