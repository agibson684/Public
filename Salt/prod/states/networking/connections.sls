{% for network_wifis, config in salt['pillar.get']('network_wifi', {}).items() %}
wireless-check-{{ config.id }}:
  file.exists:
    - name: "/etc/NetworkManager/system-connections/{{ config.id }}.nmconnection"   

wireless-modify-{{ config.id }}:
  cmd.run:
    - name: "nmcli connection modify '{{ config.id }}'  ssid '{{ config.ssid }}' ifname '{{ config.interface }}' autoconnect '{{ config.autoconnect }}' mac '{{ config.macaddress }}' "
    - require:
      - file: wireless-check-{{ config.id }} 

wireless-add-{{ config.id }}:
  cmd.run:
    - name: "nmcli connection '{{ config.func }}'  type '{{ config.type }}' con-name '{{ config.id }}' ssid '{{ config.ssid }}' ifname '{{ config.interface }}' autoconnect '{{ config.autoconnect }}' mac '{{ config.macaddress }}' save yes"
    - onfail:
      - cmd: wireless-modify-{{ config.id }}

wireless-password-{{ config.id }}:
  cmd.run: 
    - name: 'nmcli connection modify {{ config.id }} wifi-sec.psk {{ config.psk }} 802-11-wireless-security.key-mgmt wpa-psk' 
{% endfor %}

{% for devices, configs in salt['pillar.get']('network_device', {}).items() %}
device-check-{{ configs.id }}:
  file.exists:
    - name: "/etc/NetworkManager/system-connections/{{ configs.id }}.nmconnection"   

device-modify-{{ configs.id }}:
  cmd.run:
    - name: "nmcli connection modify '{{ configs.id }}' ipv4.addresses '{{ configs.address }}' ipv4.dns '{{ configs.dns }}' ipv4.gateway '{{ configs.gw }}' ifname '{{ configs.interface }}' autoconnect '{{ configs.autoconnect }}' mac '{{ configs.macaddress }}' ipv4.method '{{ configs.method }}' autoconnect '{{ configs.autoconnect }}' "
    - require:
      - file: device-check-{{ configs.id }} 

device-add-{{ configs.id }}:
  cmd.run:
    - name: "nmcli connection '{{ configs.func }}'  type '{{ configs.type }}' con-name '{{ configs.id }}'  ipv4.addresses '{{ configs.address }}' ipv4.gateway '{{ configs.gw }}'  ipv4.dns '{{ configs.dns }}' ifname '{{ configs.interface }}' autoconnect '{{ configs.autoconnect }}' mac '{{ configs.macaddress }}' autoconnect '{{ configs.autoconnect }}' ipv4.method '{{ configs.method }}' save yes"
    - onfail:
      - cmd: device-modify-{{ configs.id }}

{% endfor %}

