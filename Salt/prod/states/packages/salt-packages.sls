{% if grains['os'] == 'Centos' or grains['os'] == 'Debian' or grains['os'] == 'Fedora'%}
all_packages:
  pkg.installed:
    - pkgs:
      - salt-common: 3005.2+ds-1 
      - salt-minion: 3005.2+ds-1 
{% endif %}
{% if grains['roles'] == 'salt-master'  %}
zfs_packages:
  pkg.installed:
    - pkgs:
      - salt-master: 3005.2+ds-1 
      - salt-api: 3005.2+ds-1 
{% endif %}

