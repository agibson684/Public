firewall:
  install: true
  enabled: true
  strict: true
  ipv6: false
  services:
   ssh:
      block_nomatch: false
      ips_allow:
        - 192.168.1.0/24
    http:
      block_nomatch: false
      ips_allow:
        - 192.168.1.0/24
    https:
      block_nomatch: false
      ips_allow:
        - 192.168.1.0/24
#ntp 
    123:
      block_nomatch: false
      protos:
        - udp
      ips_allow:
        - 192.168.1.0/24

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



