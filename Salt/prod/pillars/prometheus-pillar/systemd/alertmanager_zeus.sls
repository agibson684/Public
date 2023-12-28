systemd:
  service: 
    alertmanager-prometheus:
      status: start
      Unit:
        Description: 'alertmanager'
      Service:
        ExecStart: '/etc/prometheus/alertmanager/alertmanager --config.file=/etc/prometheus/alertmanager/alertmanager.yml  --storage.path=/etc/prometheus/alertmanager/data/'
        Type: 'simple'
        User: 'root'
        Restart: 'always'
        RestartSec: 30
      Install:
        WantedBy: 'multi-user.target'

