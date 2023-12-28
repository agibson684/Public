/home/ssh_check/.profile:
  file.managed:
    - users: ssh_check
    - group: admins
    - mode: "0600"
    - source: salt://shell/files/.profile
/home/ssh_check/.dir_colors:
  file.managed:
    - users: ssh_check
    - group: admins
    - mode: "0600"
    - source: salt://shell/files/.dir_colors
/home/ssh_check/.bashrc:
  file.managed:
    - users: ssh_check
    - group: admins
    - mode: "0600"
    - source: salt://shell/files/bashrc
/home/ssh_check/bin:
  file.directory:
    - users: ssh_check
    - group: admins
    - mode: "0755"
/home/ssh_check/.ssh:
  file.directory:
    - users: ssh_check
    - group: admins
    - mode: "0700"
ssh_check:
  user.present:
    - fullname: ssh_check
    - shell: /bin/bash
    - home: /home/ssh_check
    - groups:
      - admins 
