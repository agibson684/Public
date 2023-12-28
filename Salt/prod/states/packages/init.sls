{% if grains['os'] == 'Centos' %}
{% elif grains['os'] == 'Debian' %}
  include:
    - packages.upgrades
{% elif grains['os'] == 'Fedora' %}
{% else  %}
{% endif %}

