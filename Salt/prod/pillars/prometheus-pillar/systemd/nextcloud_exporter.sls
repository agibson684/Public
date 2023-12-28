systemd:
  service: 
    nextcloud-exporter:
      status: start
      Unit:
        Description: 'service exporter'
        User: 'root'
      Service:
        Restart: always 
        RestartSec: 30 
        ExecStart: '/usr/bin/nextcloud-exporter -s https://zeus.thrace-lan.info/nexcloud -u erin -p Bqvn3J^Vay3# -a "127.0.0.1:9205"' 
        Type: 'simple'
      Install:
        WantedBy: 'multi-user.target'

