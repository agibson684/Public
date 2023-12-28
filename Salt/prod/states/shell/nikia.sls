/home/nikia/.profile:
  file.managed:
    - users: nikia
    - group: admins
    - mode: "0600"
    - source: salt://shell/files/.profile
/home/nikia/.dir_colors:
  file.managed:
    - users: nikia
    - group: admins
    - mode: "0600"
    - source: salt://shell/files/.dir_colors
/home/nikia/.bashrc:
  file.managed:
    - users: nikia
    - group: admins
    - mode: "0600"
    - source: salt://shell/files/bashrc
/home/nikia/bin:
  file.directory:
    - users: nikia
    - group: admins
    - mode: "0755"
/home/nikia/.ssh:
  file.directory:
    - users: nikia
    - group: admins
    - mode: "0700"
nikia:
  user.present:
    - fullname: nikia
    - shell: /bin/bash
    - home: /home/nikia
    - groups:
      - admins 
