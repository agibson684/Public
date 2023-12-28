include:
  - .packages

/sbin/setenforce 0:
  cmd.run:
    - unless: getenforce | grep -E 'Permissive|Disabled'

/etc/selinux/config:
  file.managed:
    - source: salt://selinux/conf/disabled
    - user: root
    - group: root
    - mode: 644
    - template: jinja

