/home/sshfs/.profile:
  file.managed:
    - users: sync_user
    - group: admins
    - mode: "0600"
    - source: salt://shell/files/.profile
/home/sshfs/.dir_colors:
  file.managed:
    - users: sync_user
    - group: admins
    - mode: "0600"
    - source: salt://shell/files/.dir_colors
/home/sshfs/.bashrc:
  file.managed:
    - users: sync_user
    - group: admins
    - mode: "0600"
    - source: salt://shell/files/bashrc
/home/sshfs/bin:
  file.directory:
    - users: sync_user
    - group: admins
    - mode: "0755"
/home/sshfs/.ssh:
  file.directory:
    - users: sync_user
    - group: admins
    - mode: "0700"
sshfs_user:
  user.present:
      - name: sshfs
      - fullname: sshfs
      - shell: /bin/bash
      - home: /home/sshfs
      - groups:
        - admins 
