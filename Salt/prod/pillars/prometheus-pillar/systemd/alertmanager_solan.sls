systemd:
  service:
    alertmanager-prometheus:
      status: start
      Unit:
        Description: 'alertmanager'
      Service: 
        ExecStart: '/etc/prometheus/alertmanager/alertmanager --config.file=/etc/prometheus/alertmanager/alertmanager.yml --cluster.peer=192.168.1.221:9094'
        Type: 'simple'
        User: 'prometheus'
        Restart: 'always'
        RestartSec: 30
      Install:
        WantedBy: 'multi-user.target'

