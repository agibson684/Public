#
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
#nrpe
    5666:
      block_nomatch: false
      protos:
        - tcp
      ips_allow:
        - 192.168.1.0/24

