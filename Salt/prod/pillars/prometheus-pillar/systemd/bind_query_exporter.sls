systemd:
  service: 
    bind_query_exporter:
      status: start
      Unit:
        Description: 'service exporter'
        User: 'root'
      Service:
        Restart: always 
        RestartSec: 30 
        ExecStart: '/usr/bin/bind_query_exporter --log="/var/log/daemon.log"'
        Type: 'simple'
      Install:
        WantedBy: 'multi-user.target'
