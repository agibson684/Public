systemd:
  service: 
    connection-status-exporter:
      status: start
      Unit:
        Description: 'service exporter'
        User: 'root'
      Service:  
        Restart: always 
        RestartSec: 30 
        ExecStart: '/usr/bin/connection-status-exporter  -config-file "/etc/connect.yaml"'
        Type: 'simple'
      Install:
        WantedBy: 'multi-user.target'

