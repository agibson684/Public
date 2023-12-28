openvpn_packages:
  pkg.installed:
    - pkgs:
      - python-transmissionrpc
      - curl
      - jq
      - openvpn
openvpn-service: 
  service.running:
    - name: openvpn@Mexico

/etc/openvpn/:
  file.directory:   
    - source: salt://openvpn/files/

#systemctl enable openvpn@Mexico
#systemctl start openvpn@Mexico
