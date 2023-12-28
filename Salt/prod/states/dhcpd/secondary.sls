pushover-message:
  pushover.post_message:
    - user: {{ salt['pillar.get']('pushuser') }}
    - token: {{ salt['pillar.get']('pushtoken') }}
    - title: Salt Returner
    - device: oneplus6
    - priority: -1
    - expire: 3600
    - retry: 5
    - message: 'Error DHCPD Failed to Start!'
    - onfail:
      - service: dhcp-service

isc-dhcp-server:
  pkg.installed

dhcp-service:
  service.running:
    - name: "isc-dhcp-server"
    - watch:
      - file: dhcpd-file-config

dhcpd-file-config:
  file.managed:
    - user: root
    - group: root
    - mode: '0644'
    - template: jinja
    - names: 
      - /etc/dhcp/dhcpd.conf:
        - source: salt://dhcpd/files/secondary.dhcpd.conf
      - /etc/dhcp/dhcpd.master:
        - source: salt://dhcpd/files/dhcpd.master

