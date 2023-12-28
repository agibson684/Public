/etc/samba/smb.conf:
  file.managed: 
    - source: {{ salt['pillar.get']('samba:config') }}
    - user: root
    - group: root
    - mode: 644
    - template: jinja
samba_packages:
  pkg.installed:
    - pkgs:
      - samba
      - cifs-utils
      - smbclient
{% if grains['os'] == 'Debian' %}
      - samba-common-bin
smbd: 
  service.running:
    - enable: True
    - reload: True
    - watch: 
      - pkg: samba_packages
{% else %}
samba: 
  service.running:
    - enable: True
    - reload: True
    - watch: 
      - pkg: samba_packages
{% endif %}
 
