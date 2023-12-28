systemd:
  service: 
    prometheus-node-exporter-smartmon:
      status: start
      Unit: 
        Description: 'Collect SMART metrics for prometheus-node-exporter'
      Service:
        Environment: 'TMPDIR=/var/lib/prometheus/node-exporter'
        ExecStart: '/bin/bash -c "/usr/share/prometheus-node-exporter-collectors/smartmon.sh | sponge /var/lib/prometheus/node-exporter/smartmon.prom"'
        Type: 'oneshot'
