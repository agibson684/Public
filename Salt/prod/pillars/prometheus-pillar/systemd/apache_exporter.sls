systemd:
  service: 
    apache_exporter:
      status: start
      Unit:
        Description: 'apache exporter'
        User: 'root'
      Service:
        ExecStart: '/usr/bin/apache_exporter  --telemetry.address=":9117" --scrape_uri "http://192.168.1.204/server-status?auto"'
        Type: 'simple'
        Restart: 'always'
        RestartSec: 30
      Install:
        WantedBy: 'multi-user.target'

