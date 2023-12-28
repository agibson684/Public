consul:
  configs:
    /etc/consul.d/blackbox.json:
      source: salt://consul/files/services/blackbox.json 
    /etc/consul.d/prometheus.json:
      source: salt://consul/files/services/prometheus.json
#    /etc/consul.d/bind-exporters.json: 
#      source: salt://consul/files/services/bind-exporters.json
#    /etc/consul.d/bind.json: 
#      source: salt://consul/files/services/bind.json
#    /etc/consul.d/domain-exporters.json: 
#      source: salt://consul/files/services/domain-exporters.json
    /etc/consul.d/connect-exporters.json: 
      source: salt://consul/files/services/connect-exporters.json
    /etc/consul.d/systemd-exporters.json:
      source: salt://consul/files/services/systemd-exporters.json
