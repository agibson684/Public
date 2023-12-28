# ElasticSearch 5.x GPG Key

rpm --import https://artifacts.elastic.co/GPG-KEY-elasticsearch:
  cmd.run:
    - unless: rpm -q --queryformat "%{SUMMARY}\n" gpg-pubkey | grep -ic "elasticsearch"
