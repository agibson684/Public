systemd:
  service: 
    domain_exporter:
      status: start
      Unit:
        Description: 'service exporter'
        User: 'root'
      Service:
        Restart: always 
        RestartSec: 30 
        ExecStart: '/usr/bin/domain_exporter --config="/etc/domain_exporter.yaml" '
        Type: 'simple'
      Install:
        WantedBy: 'multi-user.target'

