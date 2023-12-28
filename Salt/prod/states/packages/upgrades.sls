  unattended-upgrades:
    pkg:
      - installed

  02periodic:
    file.managed:
      - name: /etc/apt/apt.conf.d/02periodic
      - users: root
      - group: root
      - mode: "0644"
      - template: jinja 
      - source: salt://packages/files/02periodic

  50unattended-upgrades:
    file.managed:
      - name: /etc/apt/apt.conf.d/50unattended-upgrades
      - users: root
      - group: root
      - mode: "0644"
      - template: jinja 
      - source: salt://packages/files/50unattended-upgrades
  20auto-upgrades:
    file.managed:
      - name: /etc/apt/apt.conf.d/20auto-upgrades
      - users: root
      - group: root
      - mode: "0644"
      - template: jinja
      - source: salt://packages/files/20auto-upgrades
