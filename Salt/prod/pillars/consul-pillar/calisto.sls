consul:
  configs:
    /etc/consul.d/blackbox.json:
      source: salt://consul/files/services/blackbox.json 
    /etc/consul.d/prometheus.json:
      source: salt://consul/files/services/prometheus.json
#    /etc/consul.d/dhcpd-exporters.json:
#      source: salt://consul/files/services/dhcpd-exporters.json
#    /etc/consul.d/elastic-exporters.json:  
#      source: salt://consul/files/services/elastic-exporters.json
    /etc/consul.d/systemd-exporters.json:
      source: salt://consul/files/services/systemd-exporters.json
    /etc/consul.d/digitalocean_exporter.json:
      source: salt://consul/files/services/digitalocean_exporter.json
