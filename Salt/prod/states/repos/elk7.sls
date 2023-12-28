# ELK Repo
{% if grains['os'] == 'CentOS' %}
elk-repo7:
  cmd.run:
    - name: rpm --import https://artifacts.elastic.co/GPG-KEY-elasticsearch

  file.managed:
    - name: /etc/yum.repos.d/elasticsearch7-1.repo
    - source: salt://repos/files/elasticsearch7-1.repo
    - user: root
    - group: root
    - mode: 644
{% elif grains['os'] == 'Debian' %}
elk-repo7:
  pkgrepo.managed:
    - humanname: elk-repo7
    - name: deb https://artifacts.elastic.co/packages/7.x/apt stable main
    - file: /etc/apt/sources.list.d/elastic-7.x_debian.list
    - key_url: salt://repos/files/elasticsearch_debian.pub
{% endif %}
