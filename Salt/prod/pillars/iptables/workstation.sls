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
    3551:
      block_nomatch: false
      ips_allow:
        - 192.168.1.0/24
#quassel
    4242:
      block_nomatch: false
    
