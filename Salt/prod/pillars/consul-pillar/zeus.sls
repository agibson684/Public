consul:
  configs:
    /etc/consul.d/blackbox.json:
      source: salt://consul/files/services/blackbox.json 
    /etc/consul.d/prometheus.json:
      source: salt://consul/files/services/prometheus.json
    /etc/consul.d/apache.json:
      source: salt://consul/files/services/apache.json
    /etc/consul.d/nextcloud-exporters.json: 
      source: salt://consul/files/services/nextcloud-exporters.json
    /etc/consul.d/connect-exporters.json: 
      source: salt://consul/files/services/connect-exporters.json
    /etc/consul.d/systemd-exporters.json:
      source: salt://consul/files/services/systemd-exporters.json
    /etc/consul.d/ssh-check-exporters.json:
      source: salt://consul/files/services/ssh-check-exporters.json
 
