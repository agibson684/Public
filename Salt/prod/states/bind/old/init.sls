#do multiple loops for the file.managed files. we are using the style of the backup script.
bind9-package:
  pkg.installed
    - pkgs:
      - bind9
      - bind9-doc

bind9:
  service.running:
    - watch:
      - file: /var/bind9/chroot/*
{% for file_type, config in salt['pillar.get']('file_types', {}).items() %}       
  bind9-files-{{ file_type }}:
    file.managed:
      - user: bind
      - group: bind
      - mode: 644
      - template: jinja
      - name:{{ config.path }}
      - source: {{ config.source }}
        - /var/bind9/chroot/etc/bind/db.{{ config.domain }}:
          - source: salt://bind9/files/db.domain.erb
        - /var/bind9/chroot/var/lib/bind/db.{{ config.domain }}:
          - source: salt://bind9/files/db.domain.erb
        - /var/bind9/chroot/etc/bind/db.{{ config.domain }}.inv:
          - source: salt://bind9/files/db.domain.inv.erb
        - /var/bind9/chroot/var/lib/bind/db.{{ config.domain }}.inv:
          - source: salt://bind9/files/db.domain.inv.erb
        - /var/bind9/chroot/etc/bind/named.conf:
          - source: salt://bind9/files/named.conf.erb
        - /var/bind9/chroot/etc/bind/named.conf.options:
          - source: salt://bind9/files/named.conf.options.erb
        - /var/bind9/chroot/etc/bind/named.conf.local:
          - source: salt://bind9/files/named.conf.local.erb
      - require:
        - pkg: bind9-packages
{% endfor %} 
bind9-dir:
  file.directory:
    - user: bind
    - group: bind
    - mode: 775
    - names:
      - /var/bind9/chroot/var/cache/bind:
      - /var/bind9/chroot/var/run/named:
      - /var/bind9/chroot/var/log:
      - /var/bind9/chroot/dev:
      - /var/bind9/chroot/etc/bind:
      - /var/bind9/chroot/etc: 
      - /var/bind9: 
      - /var/bind9/chroot:
      - /var/bind9/chroot/var:
      - /var/bind9/chroot/var/cache:
      - /var/bind9/chroot/var/run:
      - /var/bind9/chroot/var/lib:
      - /var/bind9/chroot/var/lib/bind:
bind9-link:
  file.symlink:
    - user: bind
    - group: bind
    - mode: 644
    - names:
      - /etc/bind
        - target: /var/bind9/chroot/etc/bind
      - /var/lib/bind/
        - target: /var/bind9/chroot/var/lib/bind
/etc/default/bind9:
  file.managed:
    - user: root
    - group: root
    - mode: 655
    - source: salt://bind9/files/bind9
/etc/init.d/bind9:
  file.managed:
    - user: root
    - group: root
    - mode: 655
    - source: salt://bind9/files/bind9-init.d
bind9-zonefiles:
    - user: bind
    - group: bind
    - mode: 644
    - names:
      - /var/bind9/chroot/etc/bind/db.0
        - source: salt://bind9/files/db.0
      - /var/bind9/chroot/etc/bind/db.127
        - source: salt://bind9/files/db.127
      - /var/bind9/chroot/etc/bind/db.255
        - source: salt://bind9/files/db.255
      - /var/bind9/chroot/etc/bind/db.empty
        - source: salt://bind9/files/db.empty
      - /var/bind9/chroot/etc/bind/db.local
        - source: salt://bind9/files/b.local
      - /var/bind9/chroot/etc/bind/db.root
        - source: salt://bind9/files/db.root
      - /var/bind9/chroot/etc/bind/named.conf.default-zones
        - source: salt://bind9/files/named.conf.default-zones
      - /var/bind9/chroot/etc/bind/named.conf.log
        - source: salt://bind9/files/named.conf.log
      - /var/bind9/chroot/etc/bind/zones.rfc1918
        - source: salt://bind9/files/zones.rfc1918
