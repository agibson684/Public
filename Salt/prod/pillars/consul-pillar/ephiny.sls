consul:
  configs:
    /etc/consul.d/blackbox.json:
      source: salt://consul/files/services/blackbox.json 
    /etc/consul.d/prometheus.json:
      source: salt://consul/files/services/prometheus.json
    /etc/connect-exporters.json: 
      source: salt://consul/files/services/connect-exporters.json
    /etc/systemd-exporters.json:
      source: salt://consul/files/services/systemd-exporters.json
