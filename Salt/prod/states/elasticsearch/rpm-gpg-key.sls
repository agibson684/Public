# ElasticSearch GPG Key

rpm --import http://packages.elasticsearch.org/GPG-KEY-elasticsearch:
  cmd.run:
    - unless: rpm -q --queryformat "%{SUMMARY}\n" gpg-pubkey | grep -ic "elasticsearch"
