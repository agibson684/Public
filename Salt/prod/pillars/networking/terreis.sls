network_device:
  Terreis1:
    id: 'terreis1'
    type: 'ethernet'
    priority: '800'
    interface: 'eno1'
    macaddress: '04:92:26:59:85:b6'
    address: '192.168.1.222/24'
    gw: '192.168.1.1'
    dns: '192.168.1.1,8.8.8.8,208.67.222.222,208.67.220.220'
    method: 'manual'
    func: 'add'
    autoconnect: yes
    save: yes 
network_wifi:
  Terreis2:
    func: 'add'
    id: 'terreis2'
    type: 'wifi'
    priority: '700'
    interface: 'wlp5s0'
    macaddress: '18:1d:ea:09:65:05'
    psk: 'Hellokitty684'
    ssid: 'Thrace'
    autoconnect: yes
    save: yes 

