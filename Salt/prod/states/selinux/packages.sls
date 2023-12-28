#Debian install 
{% if grains['os'] == 'Debian' %}
selinux_deb_packages:
  pkg.installed:
    - pkgs:
      - selinux-basics 
      - selinux-policy-default
      - auditd
      - setools
{% elif grains['os'] == 'Centos'  %}
selinux_centos_packages:
  pkg.installed:
    - pkgs:
      - selinux-basics
      - selinux-policy-targeted
      - auditd
      - setools
      - setools-console
{% endif %}

