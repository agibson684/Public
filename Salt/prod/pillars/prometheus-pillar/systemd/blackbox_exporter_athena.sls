systemd:
  service: 
    blackbox_exporter:
      status:
      Unit:
        Description: 'service exporter'
        User: 'root'
      Service:
        Restart: always 
        RestartSec: 30 
        ExecStart: '/usr/bin/blackbox_exporter  --web.listen-address="10.132.113.8:9115" --config.file="/etc/prometheus/blackbox.yml"'
        Type: 'simple'
      Install:
        WantedBy: 'multi-user.target'

