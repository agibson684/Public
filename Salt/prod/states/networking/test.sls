# New Style
#test.random_hash:
#  module.run:
#    - test.random_hash:
#      - size: 42
#      - hash_type: sha256

# Legacy Style
#test.random_hash:
#  module.run:
#    - size: 42
#    - hash_type: sha256
#just some examples for the new 2005 style coming up but we are on 2004 now so using legacy 
#example for positional in range 
{# {%- elif salt["grains.get"]("osrelease_info[1]", "") == "10" and salt["grains.get"]("os", "") == "Debian" %} #}
{% if '08:00:27:18:0d:35' in salt["grains.get"]("hwaddr_interfaces:[1]") %}

test.wan:
  module.run: 
    - network.connect:
      - name: test google
      - host: google.com
      - port: 80 
test.lan:
  module.run: 
    - network.connect:
      - name: test router
      - host: 192.168.1.1
      - port: 8080
test.server:
  module.run: 
    - network.connect:
      - name: test gabrielle
      - host: 192.168.1.201
      - port: 22


{% endif %}    
