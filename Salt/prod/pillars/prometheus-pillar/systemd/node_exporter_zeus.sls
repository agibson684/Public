systemd:
  servicname: 
    node_exporter:
      status: start
      Unit:
        Description: 'service exporter'
        User: 'root'
      Service:
        Restart: always 
        RestartSec: 30 
        ExecStart: '/usr/bin/node_exporter --web.listen-address="10.132.113.9:9100"  --collector.textfile.directory="/var/lib/prometheus/node-exporter/"'
        Type: 'simple'
      Install:
        WantedBy: 'multi-user.target'

