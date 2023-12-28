systemd:
  service: 
    apache_exporter:
      status: start
      Unit:
        Description: 'apache exporter'
        User: 'root'
      Service:
        Restart: always 
        RestartSec: 30 
        ExecStart: '/usr/bin/apache_exporter  --telemetry.address="10.132.113.9:9117" --scrape_uri "http://10.132.113.9/server-status?auto"'
        Type: 'simple'
      Install:
        WantedBy: 'multi-user.target'

