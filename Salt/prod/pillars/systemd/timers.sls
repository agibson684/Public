systemd:
  service:    
    prometheus-node-exporter-apt:
      status: start
      Unit: 
        Description: 'run apt metrics collection every 15 minutes, salt-stack timer do not edit'
      Timer: 
        OnBootSec: '0'
        OnUnitActiveSec: '15min' 
      Install: 
        WantedBy: 'timers.target'      
    prometheus-node-exporter-smartmon:
      status: start
      Unit:
        Description: 'run smart metrics collections every 15 min, salt-stack timer do not edit'
      Timer:
        PathathExist: '/usr/sbin/smartctl'
        PathExistGlob: '/dev/sd*'
        OnBootSec: '0'
        OnUnitActiveSec: '15min'
      Install:
        WantedBy: 'timers.target'
