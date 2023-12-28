systemd:
  service: 
    ssh_exporter:
      status: start
      Unit:
        Description: 'service exporter'
        User: 'root'
      Service:
        Restart: always 
        RestartSec: 30 
        ExecStart: '/usr/bin/ssh_exporter --config.file="/etc/ssh_exporter.yaml" --web.listen-address="10.132.113.9:9312"'
        Type: 'simple'
      Install:
        WantedBy: 'multi-user.target'

