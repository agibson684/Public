systemd:
  service: 
    digitalocean_exporter:
      status: start
      Unit:
        Description: 'digitalocean_exporter'
        User: 'root'
      Service:
        ExecStart: '/usr/bin/digitalocean_exporter ----digitaloceantoken=""'
        Type: 'simple'
        Restart: 'always'
        RestartSec: 30
      Install:
        WantedBy: 'multi-user.target'

