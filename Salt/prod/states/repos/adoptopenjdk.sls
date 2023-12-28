# cloverdx Repo
{% if grains['os'] == 'CentOS' %}
adoptopenjdk:
  cmd.run:
    - name: rpm --import https://adoptopenjdk.jfrog.io/adoptopenjdk/api/gpg/key/public

  file.managed:
    - name: /etc/yum.repos.d/adoptopenjdk.repo
    - source: salt://repos/files/adoptopenjdk.repo
    - user: root
    - group: root
    - mode: 644
{% elif grains['os'] == 'Debian' %}
adoptopenjdk:
  pkgrepo.managed:
    - humanname: adoptopenjdk
    - name: deb https://adoptopenjdk.jfrog.io/adoptopenjdk/deb/ buster main
    - file: /etc/apt/sources.list.d/adoptopenjdk_debian.list
    - key_url: salt://repos/files/adoptopenjdk_debian.pub
{% endif %}
