{% if grains['os'] == 'Centos' %}
  cronie:
    pkg:
      - installed
  crond:
    service:
      - running
      - Enable: True
{% elif grains['os'] == 'Debian' %}
  cron:
    pkg:
      - installed
    service:
      - name: cron
      - running
      - Enable: True
{% elif grains['os'] == 'Fedora' %}
  cron:
    pkg:
      - installed
  crond:
    service:
      - running
      - Enable: True
{% elif grains['os'] == 'Arch' %}
  cron:
    pkg:
      - name: cronie
      - installed
  cronie:
    service:
      - running
      - Enable: True
{% else  %}
  cron:
    pkg:
      - installed
    service:
      - name: cron
      - running
      - Enable: True
{% endif %}

