systemd:
  service: 
    prometheus-node-exporter-apt:
      status: start
      Unit: 
        Description: 'Collect apt metrics for prometheus-node-exporter'
      Service: 
        Environment: 'TMPDIR=/var/lib/prometheus/node-exporter'
        ExecStart: '/bin/bash -c "/usr/share/prometheus-node-exporter-collectors/apt.sh | sponge /var/lib/prometheus/node-exporter/apt.prom"'
        Type: 'oneshot'

