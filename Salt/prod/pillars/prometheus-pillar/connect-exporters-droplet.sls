exporters:
  connection-status-exporter: 
    path: '/usr/bin'
config: '/etc/droplet_connect.yaml'
{#
config file just for a save spot
sockets:
  - name: hostname-http
    host: 127.0.0.1
    port: 80
    protocol: tcp
  - name: hostname-https 
    host: 127.0.0.1
    port: 8080
    timeout: 2
  - name: athena-https
    host: athena.thrace-lan.info
    port: 443
    timeout: 60
  - name: zeus-https
    host: zeus.thrace-lan.info
    port: 443
    timeout: 60 
#}
