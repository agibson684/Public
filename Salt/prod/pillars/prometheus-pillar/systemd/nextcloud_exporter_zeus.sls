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
        ExecStart: '/usr/bin/nextcloud-exporter -s https://zeus.thrace-lan.info/nextcloud/index.php/apps/dashboard/ -u Eryn684 -p Bqvn3J^Vay3#  -a "10.132.113.9:9205"' 
        Type: 'simple'
      Install:
        WantedBy: 'multi-user.target'

