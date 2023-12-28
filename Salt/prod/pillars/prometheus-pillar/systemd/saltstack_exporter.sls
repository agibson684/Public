systemd:
  service:
    saltstack_exporter:
      status: start
      Unit:
        Description: 'service exporter'
        User: 'root'
      Serivce: 
        ExecStart: '/usr/bin/saltstack_exporter.py'
        Type: 'simple'
      Install:
        WantedBy: 'multi-user.target'

