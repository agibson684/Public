
/etc/NetworkManager/system-connections/bookit.com.nmconnection:
  file.managed:
    - users: root
    - group: root
    - mode: "0700"
    - source: salt://networking/files/bookit.com.nm
/etc/NetworkManager/system-connections/new.bookit.com.nmconnection:
  file.managed:
    - users: root
    - group: root 
    - mode: "0700"
    - source: salt://networking/files/new.bookit.com.nmconnection
/etc/NetworkManager/system-connections/vpn3.bookit.com.nmconnection:
  file.managed:
    - users: root
    - group: root 
    - mode: "0700"
    - source: salt://networking/files/vpn3.bookit.com.nmconnection
