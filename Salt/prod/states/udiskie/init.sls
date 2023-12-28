#{% if grains['os'] == 'centos' or grains['os'] == 'debian' or grains['os'] == 'fedora'%}
#default_packages:
#  pkg.installed:
#    - pkgs:
#      - udisks
#{% endif %}
{% if grains['os'] == 'Debian' %}
debian_packages:
  pkg.installed:
    - pkgs:
      - udisks2
      - python-setuptools      
      - python3-gi
      - python3-yaml
      - gobject-introspection
      - libgtk2.0-0
      - libnotify4
      - gettext
      - gir1.2-notify-0.7
udiskie:
  pip.installed:
    - require:
      -  pkg: debian_packages

/etc/polkit-1/localauthority/50-local.d/consolekit.pkla:
  file.managed:
    - source: salt://udiskie/files/consolekit.pkla
    - user: root
    - group: root
    - mode: 700

{% endif %}
#{% if grains['os'] == 'Fedora' %}
#fedora_packages:
#  pkgs.installed:
#    - pkgs:
#      - 
#{% endif %}
