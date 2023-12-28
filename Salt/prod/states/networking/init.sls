include: 
  - networking.connections

{#{%- if 'laptop' in salt['grains.get']('roles') %} #}
  {%- for service in ['connman', 'systemd-networkd', 'iwd', 'dhcpcd'] %}
net-service-disabled-{{ service }}:
  service.dead:
    - name: {{ service }}
    - enable: false

# needs to be ordered via `requires` after stopping and disabling them, otherwise they won't be found and can't be stopped
net-service-masked-{{ service }}:
  service.masked:
    - name: {{ service }}
    - require:
      - net-service-disabled-{{ service }}
    - require_in:
      - net-packages-removed
  {%- endfor %}

# needs to be ordered via `require_in` (above) after having stopped and masked them, otherwise those operations would fail
net-packages-removed:
  pkg.removed:
    - pkgs:
      - connman
      - iwd
      - dhcpcd
{#{%- endif %} #}
