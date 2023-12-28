firewall:
  install: true
  enabled: true
  strict: true
  ipv6: false
  services:
#dhcpd
    67:
      block_nomatch: false
      ips_allow:
        - 192.168.1.0/24
    ssh:
      block_nomatch: false
    http:
      block_nomatch: false
      ips_allow:
        - 192.168.1.0/24
    https:
      block_nomatch: false
  #ntp 
    123:
      block_nomatch: false
      protos:
        - udp
      ips_allow:
        - 192.168.1.0/24
#MPD
    6600:
      block_nomatch: false
      protos: 
        - tcp
      ips_allow:
        - 192.168.1.0/24
#MPD
    8000:
      block_nomatch: false 


#smb
    445:
      block_nomatch: false
      protos: 
        - tcp
      ips_allow:
        - 192.168.1.0/24
#nrpe
    5666:
      block_nomatch: false
      protos: 
        - tcp
      ips_allow:
        - 167.71.188.165
        - 192.168.10/24





