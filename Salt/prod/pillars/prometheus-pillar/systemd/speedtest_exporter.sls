systemd:
  speedtest_exporter:
    status: start
    Unit:
      Description: 'service exporter'
      User: 'root'
    Service:
        Restart: always 
        RestartSec: 30 
      ExecStart: '/usr/bin/speedtest_exporter -web.listen-address="127.0.0.1:9112"'
      Type: 'simple'
    Install:
      WantedBy: 'multi-user.target'

