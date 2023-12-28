systemd:
  service: 
    nrpe_exporter:
      status: start
      Unit:
        Description: 'service exporter'
        User: 'root'
      Serivce:
        ExecStart: '/usr/bin/nrpe_exporter --web.listen-address=":9275"'
        Type: 'simple'
      Install:
        WantedBy: 'multi-user.target'

