firewall:
  install: true
  enabled: true
  strict: true
  ipv6: false
  services:
    ssh:
      block_nomatch: false
    http:
      block_nomatch: false
    https:
      block_nomatch: false
    60000:
      block_nomatch: false
      protos: 
        - udp
    60001:
      block_nomatch: false
      protos: 
        - udp
    60002:
      block_nomatch: false
      protos: 
        - udp
    60003:
      block_nomatch: false
      protos: 
        - udp
    60004:
      block_nomatch: false
      protos: 
        - udp
    60005:
      block_nomatch: false
      protos: 
        - udp
    60006:
      block_nomatch: false
      protos: 
        - udp
    60007:
      block_nomatch: false
      protos: 
        - udp
    60008:
      block_nomatch: false
      protos: 
        - udp
    60009:
      block_nomatch: false
      protos: 
        - udp
    60010:
      block_nomatch: false
      protos: 
        - udp
#Salt-Master
    4505:
      block_nomatch: false
      protos:
        - tcp
      ips_allow:
        - 192.168.1.0/24
    4506:
      block_nomatch: false
      protos:
        - tcp
      ips_allow:
        - 192.168.1.0/24

#salt-api
    8001:
      block_nomatch: false
      protos:
        - tcp
      ips_allow:
        - 192.168.1.0/24

