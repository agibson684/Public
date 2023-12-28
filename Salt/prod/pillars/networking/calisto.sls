network_device:
  Calisto1:
    id: 'calisto1'
    type: 'ethernet'
    priority: '1'
    interface: 'eno1'
    macaddress: '0c:c4:7a:cd:c7:b8'
    address: '192.168.1.220/24'
    gw: '192.168.1.1'
    dns: '192.168.1.1,8.8.8.8,208.67.222.222,208.67.220.220'
    method: 'manual'
    func: 'add'
    autoconnect: yes
  Calisto2:
    id: 'calisto2'
    type: 'ethernet'
    priority: '1'
    interface: 'eno2'
    macaddress: '0c:c4:7a:cd:c7:b9'
    address: '192.168.1.220/24'
    gw: '192.168.1.1'
    dns: '192.168.1.1,8.8.8.8,208.67.222.222,208.67.220.220'
    method: 'manual'
    func: 'add'
    autoconnect: yes
