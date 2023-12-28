consul_template:
  # Start consul-template daemon and enable it at boot time
  service: True

  config:
{%- if grains['id'] == 'terreis.thrace.lan'  %}
    consul: {{ grains["fqdn_ip4"] }}:8500
    log_level: info
{% else %}
    consul: 127.0.0.1:8500
    log_level: info
{% endif %}    
		
  tmpl:
    - name: example.com
      source: salt://files/example.com.ctmpl
      config:
        template:
          source: /etc/consul-template/tmpl-source/example.com.ctmpl
          destination: /etc/nginx/sites-enabled/example.com
          command: systemctl restart nginx


