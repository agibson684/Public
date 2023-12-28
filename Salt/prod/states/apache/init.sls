{% if  grains['os'] == 'Debian' %}
apache_packages:
  pkg.installed:
    - pkgs:
      - apache2
      - apache2-data
      - apache2-bin
      - libapache2-mod-python
      - libapache2-mod-php
      - libapache2-mod-form 
      - apache2-utils 
{% endif %}
