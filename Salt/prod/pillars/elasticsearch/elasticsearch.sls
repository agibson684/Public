elasticsearch:
  logstash:
  {%- if salt["grains.get"]("datacenter", "") == "home" %}
    host: 192.168.1.201
  {%- elif salt["grains.get"]("datacenter", "") == "droplet" %}
    host: 192.168.1.205
  {%- elif salt["grains.get"]("datacenter", "") == "vagrant" %}
    host: 192.168.33.3
  {%- endif %}

  es1:
  {%- if salt["grains.get"]("datacenter", "") == "home" %}
    node1: 192.168.1.220
  {%- elif salt["grains.get"]("datacenter", "") == "droplet" %}
    node1: 192.168.1.221
  {%- elif salt["grains.get"]("datacenter", "") == "vagrant" %}
    node1: 192.168.33.1
  {%- endif %}

  es2:
  {%- if salt["grains.get"]("datacenter", "") == "home" %}
    node2: 192.168.1.201
  {%- elif salt["grains.get"]("datacenter", "") == "droplet" %}
    node2: 192.168.1.221
  {%- elif salt["grains.get"]("datacenter", "") == "vagrant" %}
    node2: 192.168.33.2
  {%- endif %}
   
  
