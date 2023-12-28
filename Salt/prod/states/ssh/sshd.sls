{% if grains['os'] == 'Debian' %}
openssh-server:
  pkg:
    - installed
openssh-client:
  pkg:
    - installed
{% elif grains['os'] == 'Centos' %}
openssh-server:
  pkg:
    - installed
openssh-clients:
  pkg: 
    - installed
{% elif grains['os'] == 'Arch' %}
openssh:
  pkg: 
    - installed
{% endif %}
{% if grains['os'] == 'Arch' %}
sshd:
  service.running:
  - watch:
    - file: /etc/ssh/sshd_config

{% endif %}
{% if grains['os'] == 'Debian' %}
ssh:
  service.running:
  - watch:
    - file: /etc/ssh/sshd_config
{% endif %}

/etc/ssh/sshd_config:
  file.managed:
    - user: root
    - group: root
    - mode: '600'
    - template: jinja
    - source: salt://ssh/files/sshd_config

