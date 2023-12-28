pushover-message:
  pushover.post_message:
    - user: {{ salt['config.get']('pushuser') }}
    - token: {{ salt['config.get']('pushtoken') }}
    - title: Apache Salt Returner
    - device: oneplus6
    - priority: -1
    - expire: 3600
    - retry: 5
    - message: 'Error Apache Failed to Start!'
    - onfail:
      - service: apache2


webpage-dir-config:
  file.directory:
    - user: root
    - group: root
    - mode: '0644'
    - names:
      - /etc/apache2/conf.d
      - /etc/apache2/email
      - /usr/share/apache2/error
webpage-file-config:
  file.managed:
    - user: root
    - group: root
    - mode: '0644'
    - template: jinja
    - names: 
      - /etc/apache2/groups:
        - source: salt://apache/files/etc/groups
      - /etc/apache2/httpd.conf:
        - source: salt://apache/files/etc/httpd.conf
      - /etc/apache2/ports.conf: 
        - source: salt://apache/files/etc/ports.conf
      - /etc/apache2/email/email.conf:
        - source: salt://apache/files/etc/email/email.conf
      - /etc/apache2/apache2.conf:
        - source: salt://apache/files/etc/apache2.conf
      - /etc/apache2/sites-available/webpage.conf:
        - source: salt://apache/files/zeus.conf
      - /etc/apache2/sites-available/webpage-ssl.conf:
        - source: salt://apache/files/zeus-ssl.conf
    - require:
      - file: webpage-dir-config    

apache2:
  service.running:
    - watch: 
      - file: webpage-dir-config
      - file: webpage-file-config
