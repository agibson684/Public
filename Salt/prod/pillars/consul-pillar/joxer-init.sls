consul:
  # Start Consul agent service and enable it at boot time
  service: True

  # Set user and group for Consul config files and running service
  user: consul
  group: consul

  version: 1.6.1
  download_host: releases.hashicorp.com

  config:
    server: True
    bind_addr: 192.168.1.208

    enable_local_script_checks: True
    enable_debug: True

    datacenter: eu

    encrypt: "RIxqpNlOXqtr/j4BgvIMEw=="

    bootstrap_expect: 3
    retry_interval: 15s
    retry_join:
      - 192.168.1.204
      - 192.168.1.221

    ui: true
    log_level: info
    data_dir: /var/consul
## I gave up on this crap here and wrote my own in. 
#  register:
#    - name: Redis
#      checks:
#        - script: /usr/local/share/consul/check_redis.py
#          interval: 10s
#    - service:
#    - name: Web
#      checks:
#        - address: localhost
#        - port: 80
#        - interval: 10s
#        - timeoute: 1s
#    - name: https
#      checks:
#        - port: 443
#        - interval: 10s
#        - timeoute: 1s
#    - name: kibana
#      checks:
#        - address: localhost
#        - port: 8081
#        - interval: 10s
#        - timeoute: 1s
#    - name: ssh
#      checks:
#        - port: 22
#        - interval: 10s
#        - timeoute: 1s
#  scripts:
#    - source: salt://files/consul/check_redis.py
#      name: /usr/local/share/consul/check_redis.py
#      context:
#        port: 6379

