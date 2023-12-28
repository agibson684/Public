#flexget:
#  pip.installed
scripts-file-flexget:
  file.directory:
    - user: root
    - group: admins
    - dir_mode: 750 
    - file_mode: 750
    - mode: 750
    - name: '/opt/scripts/flexget'
scripts-flexget:
  file.managed:
    - user: root
    - group: admins
    - mode: 750
    - template: jinja
    - name: /opt/scripts/flexget/config.yml
    - source: salt://scripts/files/flexget-config.yml

