systemd:
  service: 
    cifs-exporter:
      status: start
      Unit:
        Description: 'service exporter'
      Service:
        Restart: always 
        RestartSec: 30 
        ExecStart: '/usr/bin/cifs-exporter --web.listen-address="127.0.0.1:9965"'
        Type: 'simple'
        User: 'root'
      Install:
        WantedBy: 'multi-user.target'














