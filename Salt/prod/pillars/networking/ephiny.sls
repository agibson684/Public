network_wifi:
  Ephiny2:
    func: 'add'
    id: 'ephiny2'
    type: 'wifi'
    priority: '700'
    interface: 'wlp4s0'
    macaddress: '44:85:00:ef:e8:45'
    psk: 'Hellokitty684'
    ssid: 'Thrace'
    autoconnect: true
    save: yes 
  Ephiny3:
    func: 'add'
    id: 'ephiny3'
    type: 'wifi'
    priority: '800'
    interface: 'wlp4s0'
    macaddress: '44:85:00:ef:e8:45'
    psk: 'aeda38fc'
    ssid: 'M2000-65E4'
    autoconnect: true
    save: yes 
network_device:
  Ephiny1:
    id: 'ephiny1'
    type: 'ethernet'
    priority: '900'
    interface: 'enp0s31f6'
    macaddress: 'c8:5b:76:11:26:41'
    address: '192.168.1.225/24'
    gw: '192.168.1.1'
    dns: '192.168.1.1,8.8.8.8,208.67.222.222,208.67.220.220'
    method: 'manual'
    func: 'add'
    autoconnect: true
    save: yes 
