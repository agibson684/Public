systemd:
  service: 
    ping_exporter:
      status: start
      Unit:
        Description: 'service exporter'
        User: 'root'
      Serivce:
        ExecStart: '/usr/bin/ping_exporter google.com hades.thrace-lan.info zeus.thrace-lan.info athena.thrace-lan.info calisto.thrace.lan yahoo.com --dns.nameserver="192.168.1.204"'
        Type: 'simple'
      Install:
        WantedBy: 'multi-user.target'
  
