systemd:
  service: 
    ping_exporter:
      status: start
      Unit:
        Description: 'service exporter'
        User: 'root'
      Serivce:
        ExecStart: '/usr/bin/ping_exporter google.com zeus.thrace-lan.info athena.thrace-lan.info home.thrace-lan.info yahoo.com --dns.nameserver="8.8.8.8"   --web.listen-address="10.132.113.8:9427"'
        Type: 'simple'
      Install:
        WantedBy: 'multi-user.target'
  
