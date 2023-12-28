/home/sync_user/.profile:
  file.managed:
    - users: sync_user
    - group: admins
    - mode: "0600"
    - source: salt://shell/files/.profile
/home/sync_user/.dir_colors:
  file.managed:
    - users: sync_user
    - group: admins
    - mode: "0600"
    - source: salt://shell/files/.dir_colors
/home/sync_user/.bashrc:
  file.managed:
    - users: sync_user
    - group: admins
    - mode: "0600"
    - source: salt://shell/files/bashrc
/home/sync_user/bin:
  file.directory:
    - users: sync_user
    - group: admins
    - mode: "0755"
/home/sync_user/.ssh:
  file.directory:
    - users: sync_user
    - group: admins
    - mode: "0700"
sync_user:
  user.present:
    - fullname: sync_user
    - shell: /bin/bash
    - home: /home/sync_user
    - groups:
      - admins 
