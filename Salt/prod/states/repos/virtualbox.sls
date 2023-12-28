{% if grains['os'] == 'Debian' %}
virtualbox-repo:
  pkgrepo.managed:
    - humanname: virtualbox
    - name: 'deb https://download.virtualbox.org/virtualbox/debian {{ grains['lsb_distrib_codename'] }} contrib'
    - gpgcheck: 1
    - key_url: https://www.virtualbox.org/download/oracle_vbox_2016.asc
    - file:  /etc/apt/sources.list.d/virtualbox.list
{% endif %}
