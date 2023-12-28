systemd:
  service: 
    plex_exporter:
      status: start
      Unit:
        Description: 'service exporter'
        User: 'root'
      Service:
        Restart: always 
        RestartSec: 30 
        ExecStart: '/usr/bin/plex_exporter'
        Type: 'simple'
      Install:
        WantedBy: 'multi-user.target'

