network_wifi:
  Mediacenter1:
    func: 'add'
    id: 'mediacenter1'
    type: 'wifi'
    priority: '700'
    interface: 'wlp6s0'
    macaddress: '94:b8:6d:87:15:5e'
    psk: 'Hellokitty684'
    ssid: 'Thrace'
    autoconnect: yes
    save: yes 
network_device:
  Ephiny1:
    id: 'mediacenter2'
    type: 'ethernet'
    priority: '400'
    interface: 'enp3s0'
    macaddress: '1c:1b:0d:a2:72:28'
    address: '192.168.1.224/24'
    gw: '192.168.1.1'
    dns: '192.168.1.1,8.8.8.8,208.67.222.222,208.67.220.220'
    method: 'manual'
    func: 'add'
    autoconnect: yes
    save: yes 
