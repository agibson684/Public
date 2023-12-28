{% if grains['os'] == 'Debian' %}
safe-rm:
  pkg:
    - installed

/etc/safe-rm.conf:
  file.managed:
    - users: root
    - group: root
    - mode: "0644"
    - template: jinja
    - require:
      - pkg: safe-rm
    - source: salt://sudo/files/safe-rm.conf
{% elif grains['os'] == 'Centos' %}
{% elif grains['os'] == 'Debian' %}
{% elif grains['os'] == 'Fedora' %}
{% endif %}
