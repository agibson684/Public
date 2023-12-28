pushover-message-bind:
  pushover.post_message:
    - user: {{ salt['config.get']('pushuser') }}
    - token: {{ salt['config.get']('pushtoken') }}
    - title: Salt Returner Bind
    - device: oneplus6
    - priority: 1
    - expire: 3600
    - retry: 5
    - message: 'Error Bind9  Failed to Start!'
    - onfail:
      - service: bind9

{% from  "bind/map.jinja" import bind with context %}
{% if grains['os'] == 'Debian' %}
bind9-packages:
  pkg.installed:
    - pkgs:
      - bind9
      - bind9utils
      - bind9-doc
      - dnsutils
{% elif grains['os'] == 'CentOS' %}
bind9-packages: 
  pkg.installed:
    - pkgs: 
      - bind
      - bind-utils
{% endif %}
bind9:
  service.running:
    - watch:
      - file: /var/cache/{{ bind.named }}/*

bind9-files-domain:
  file.managed:
    - user: {{ bind.user }}
    - group: {{ bind.group }}
    - mode: 644
    - template: jinja
    - names: 
      - /etc/{{ bind.named }}/db.thrace.lan
      - /var/cache/{{ bind.named }}/db.thrace.lan
    - source: salt://bind/templates/db.domain.erb
    - require:
      - pkg: bind9-packages

bind9-files-inv:
  file.managed:
    - user: {{ bind.user }}
    - group: {{ bind.group }}
    - mode: 644
    - template: jinja
    - names:
      - /etc/{{ bind.named }}/db.thrace.lan.inv
      - /var/cache/{{  bind.named }}/db.thrace.lan.inv
    - source: salt://bind/templates/db.domain.inv.erb
    - require:
      - pkg: bind9-packages

bind9-files-named.conf:
  file.managed:
    - user: {{ bind.user }}
    - group: {{ bind.group }}
    - mode: 644
    - template: jinja
    - names: 
      - /etc/{{ bind.named }}/named.conf
      - /etc/named.conf   
    - source: salt://bind/templates/named.conf.template
    - require:
      - pkg: bind9-packages

bind9-files-named.conf.options:
  file.managed:
    - user: {{ bind.user }}
    - group: {{ bind.group }}
    - mode: 644
    - template: jinja
    - names: 
      - /etc/{{bind.named}}/named.conf.options
      - /etc/{{bind.named}}/named.conf.options
    - source: salt://bind/templates/named.conf.options.template
    - require:
      - pkg: bind9-packages

bind9-files-named.conf.local:
  file.managed:
    - user: {{ bind.user }}
    - group: {{ bind.group }}
    - mode: 644
    - template: jinja
    - name: /etc/{{bind.named}}/named.conf.local
    - source: salt://bind/templates/named.conf.local.erb
    - require:
      - pkg: bind9-packages

bind9-dir:
  file.directory:
    - user: {{ bind.user }}
    - group: {{ bind.group }}
    - mode: 775
    - names:
      - /var/cache/{{bind.named}}
      - /var/run/{{bind.named}}
      - /etc/{{bind.named}}
      - /var/lib/{{bind.named}}
{#
bind9-link:
  file.symlink:
    - user: {{ bind.user }}
    - group: {{ bind.group }}
    - mode: 644
    - name: /etc/{{ bind.named }}
    - target: /etc/{{ bind.named }}
#}
{#bind9-link-var:
  file.symlink:
    - user: {{ bind.user }}
    - group: {{ bind.group }}
    - mode: 644
    - name: /var/lib/{{ bind.named }}
    - target: /var/lib/{{ bind.named }}
#}
/etc/default/{{ bind.named }}:
  file.managed:
    - user: root
    - group: root
    - mode: 655
    - source: salt://bind/files/bind9
{#
/etc/init.d/{{ bind.named }}:
  file.managed:
    - user: root
    - group: root
    - mode: 655
    - source: salt://bind9/files/bind9-init.d

bind9-zonefiles:
  file.managed:
    - user: {{ bind.user }}
    - group: {{ bind.group }}
    - mode: 644
    - names:
      - /etc/{{ bind.named }}/db.0:
        - source: salt://bind9/files/db.0
      - /etc/{{ bind.named }}/db.127:
        - source: salt://bind9/files/db.127
      - /etc/{{ bind.named }}/db.255:
        - source: salt://bind9/files/db.255
      - /etc/{{ bind.named }}/db.empty:
        - source: salt://bind9/files/db.empty
      - /etc/{{ bind.named }}/db.local:
        - source: salt://bind9/files/db.local
      - /etc/{{ bind.named }}/db.root:
        - source: salt://bind9/files/db.root
      - /etc/{{ bind.named }}/named.conf.default-zones:
        - source: salt://bind9/files/named.conf.default-zones
      - /etc/{{ bind.named }}/named.conf.log:
        - source: salt://bind9/files/named.conf.log
      - /etc/{{ bind.named }}/zones.rfc1918:
        - source: salt://bind9/files/zones.rfc1918


#}
