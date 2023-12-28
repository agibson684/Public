include:
  - .packages

/sbin/setenforce 1:
  cmd.run:
    - unless: getenforce | grep -E 'Enforcing|enabled'

/etc/selinux/config:
  file.managed:
    - source: salt://selinux/conf/enabled
    - user: root
    - group: root
    - mode: 644
    - template: jinja
