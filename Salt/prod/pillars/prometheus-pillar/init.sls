# -*- coding: utf-8 -*-
# vim: ft=yaml
---
prometheus:
  wanted:
    clientlibs:
      - golang
      - haskell
      - rust
    component:
      - prometheus
{#  do not turn this on i am using my own alertmanager  
     - alertmanager #}
      - node_exporter
      - haproxy_exporter
    # no memcached_exporter in upstream repo - only archive
    # memcached_exporter
  exporters:
    node_exporter:
      textfile_collectors_dependencies: []
      textfile_collectors:
        ipmitool:
          enable: false
          remove: false
        smartmon:
          enable: false
          remove: false 
          pkg: smartmontools
          bash_pkg: bash 
          smartctl: /usr/sbin/smartctl
     
  pkg:  
    use_upstream_archive: false
    use_upstream_repo: true

    clientlibs:
      golang:
        version: v1.6.0
    component:
      alertmanager:
        config: 
          global:
            resolve_timeout: 5m 
          route: 
            group_by: ['alertname']
            group_wait: 10s
            group_interval: 10s
            repeat_interval: 1h
            receiver: 'pushover'
          receivers: 
            - name: 'web.hook'
              webhook_configs:
                - url: 'http://127.0.0.1:5001/'
            - name: 'pushover'
              pushover_configs:
                - token: {{ salt['pillar.get']('pushtoken') }}
                  user_key: {{ salt['pillar.get']('pushuser') }}
          inhibit_rules:
            - source_match: 
                severity: 'critical'
            - target_match: 
                severity: 'warning'
                equal: ['alertname', 'dev', 'instance']      
      node_exporter:
        version: v0.18.1
        archive:
          source_hash: b2503fd932f85f4e5baf161268854bf5d22001869b84f00fd2d1f57b51b72424
        service:
          name: prometheus-node-exporter
          args:
            web.listen-address: "127.0.0.1:9100"
            # collector.textfile.directory: /var/tmp/node_exporter
      prometheus:
        service:
          args:
            web.listen-address: 0.0.0.0:9100
        config:
          # yamllint disable-line rule:line-length
          # ref https://raw.githubusercontent.com/prometheus/prometheus/release-2.10/config/testdata/conf.good.yml
          # my global config
          global:
            # Set the scrape interval to every 15 seconds. Default is every 1 minute
            scrape_interval: 15s
            # Evaluate rules every 15 seconds. The default is every 1 minute
            evaluation_interval: 15s
            # scrape_timeout is set to the global default (10s)

          # Alertmanager configuration
          alerting:
            alertmanagers:
              - static_configs:
                  - targets:
                      - localhost:9093
                      - 192.168.1.204:9093
                      - 192.168.1.221:9093

          # Load rules once and periodically evaluate them according to the global
          # 'evaluation_interval'
          rule_files:
            - "rules.yml"
            # - "second_rules.yml"

          # A scrape configuration containing exactly one endpoint to scrape:
          scrape_configs:
            # The job name is added as a label `job=<job_name>` to any timeseries
            # scraped from this config
            - job_name: 'prometheus'
              # metrics_path defaults to '/metrics'
              # scheme defaults to 'http'
              consul_sd_configs:
                - server: 'localhost:8500'
              static_configs:
                - targets: ['localhost:9100']
              relabel_configs:
                - source_labels: [__meta_consul_tags]
                  regex: .*,metrics,.*
                  action: keep
                - source_labels: [__meta_consul_service]
                  target_label: job
                - source_labels: [__meta_consul_service]
                  target_label: __param_module
                - regex: __meta_consul_service_metadata_(.*)
                  replacement: '${1}'
                  action: labelmap
                - source_labels: [__meta_consul_metadata_target]
                  target_label: __param_target
                - regex: target
                  action: labeldrop
                - source_labels: [__param_target]
                  target_label: instance
        #   - job_name: pushgateway
         #     scrape_interval: 5s
         #     honor_labels: true
         #     static_configs:
         #       - targets: ['solan.thrace.lan:9091']
 #     pushgateway:
 #       version: v0.8.0
 #       archive:
 #         source_hash: 6949866ba9ad0cb88d3faffd4281f17df79281398b4dbd0ec3aab300071681ca
 #       service:
 #         args:
 #           web.listen-address: ":9091"
 #           web.telemetry-path: "/metrics"

  linux:
    # 'Alternatives system' priority: zero disables (default)
    # yamllint disable-line rule:braces
    # this was giving errors max is 100k
   {# altpriority: {{ range(1, 9100000) | random }}#}
    altpriority: {{ range(1, 100000) | random }}
  tofs:
    # The files_switch key serves as a selector for alternative
    # directories under the formula files directory. See TOFS pattern
    # doc for more info
    # Note: Any value not evaluated by `pillar.get` will be used literally
    # This can be used to set custom paths, as many levels deep as required
    files_switch:
      - any/path/can/be/used/here
      - id
      - osfinger
      - os
      - os_family
    # All aspects of path/file resolution are customisable using the options below
    # This is unnecessary in most cases; there are sensible defaults
    # path_prefix: prometheus_alt
    # dirs:
    #   files: files_alt
    #   default: default_alt
    source_files:
      prometheus-config-file-file-managed:
        - 'alt_config.yml.jinja'
      prometheus-archive-install-managed-service:
        - 'alt_systemd.ini.jinja'
