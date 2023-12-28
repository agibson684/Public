# ElasticSearch Repo

include:
  - elasticsearch.rpm-gpg-key


elastic-search-repo:
  file.managed:
    - name: /etc/yum.repos.d/elasticsearch.repo
    - source: salt://elasticsearch/conf/elasticsearch.repo
    - user: root
    - group: root
    - mode: 644

