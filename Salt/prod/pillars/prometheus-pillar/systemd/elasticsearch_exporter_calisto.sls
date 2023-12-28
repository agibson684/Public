systemd:
  servicname: 
    elasticsearch_exporter:
      status: start 
      Unit:
        Description: 'service exporter'
        User: 'root'
      Service:
        Restart: always 
        RestartSec: 30 
        ExecStart: '/usr/bin/elasticsearch_exporter --es.uri="http://192.168.1.220:9200" '
        Type: 'simple'
      Install:
        WantedBy: 'multi-user.target'

