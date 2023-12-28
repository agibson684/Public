network_device:
  Gabrielle1:
    id: 'gabrielle1'
    type: 'ethernet'
    priority: '1'
    interface: 'eno1'
    macaddress: '0c:c4:7a:90:24:a0'
    address: '192.168.1.201/24'
    gw: '192.168.1.1'
    dns: '8.8.8.8,192.168.1.204'
    method: 'manual'
    func: 'add'
    autoconnect: yes
  Gabrielle2:
    id: 'gabrielle2'
    type: 'ethernet'
    priority: '2'
    interface: 'eno1'
    macaddress: '0c:c4:7a:90:24:a1'
    address: '192.168.1.201/24'
    gw: '192.168.1.1'
    dns: '192.168.1.1,8.8.8.8,208.67.222.222,208.67.220.220'
    method: 'manual'
    func: 'add'
    autoconnect: yes
