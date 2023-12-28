consul:
  configs:
    /etc/consul.d/blackbox.json:
      source: salt://consul/files/services/blackbox.json 
    /etc/consul.d/prometheus.json:
      source: salt://consul/files/services/prometheus.json
    /etc/consul.d/systemd-exporters.json:
      source: salt://consul/files/services/systemd-exporters.json
    /etc/consul.d/plex-exporters.json:
      source: salt://consul/files/services/plex-exporters.json
