systemd:
  service: 
    systemd_exporter:
      status: start
      Unit:
        Description: 'service exporter'
        User: 'root'
      Service:
        Restart: always 
        RestartSec: 30 
        ExecStart: '/usr/bin/systemd_exporter --collector.unit-blacklist="run-user-1000.mount|user-runtime-dir@1000.service" --web.listen-address="10.132.113.8:9558" --log.level="fatal" '
        Type: 'simple'
      Install:
        WantedBy: 'multi-user.target'

