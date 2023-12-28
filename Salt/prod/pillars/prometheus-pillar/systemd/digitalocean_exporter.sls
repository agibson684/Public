systemd:
  service: 
    digitalocean_exporter:
      status: start
      Unit:
        Description: 'digitalocean_exporter'
        User: 'root'
      Service:
        ExecStart: '/usr/bin/digitalocean_exporter ----digitaloceantoken="dop_v1_dd49c8790a8b3b303744265abe4f005d1d3df01686530f703ceac6f08612e211"'
        Type: 'simple'
        Restart: 'always'
        RestartSec: 30
      Install:
        WantedBy: 'multi-user.target'

