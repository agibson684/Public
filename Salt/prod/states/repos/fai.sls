# ELK Repo
{% if grains['os'] == 'Debian' %}
fai-repo:
  pkgrepo.managed:
    - humanname: fai-repo
    - name: deb https://fai-project.org/download bullseye koeln 
    - file: /etc/apt/sources.list.d/fai.list
    - key_url: salt://repos/files/fai-project.gpg
{% endif %}
