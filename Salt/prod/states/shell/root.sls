/root/.profile:
  file.managed:
    - users: root
    - group: root
    - mode: "0600"
    - source: salt://shell/files/.profile
/root/.dir_colors:
  file.managed:
    - users: root
    - group: admins
    - mode: "0600"
    - source: salt://shell/files/.dir_colors
/root/.bashrc:
  file.managed:
    - users: root
    - group: admins
    - mode: "0600"
    - source: salt://shell/files/bashrc.root
/root/bin:
  file.directory:
    - users: root
    - group: admins
    - mode: "0755"
/root/.ssh:
  file.directory:
    - users: root
    - group: admins
    - mode: "0700"
/root/motd.tail:
  file.managed:
    - users: root
    - group: root
    - mode: "0644"
    - force: True
    - source: salt://shell/files/motd.tail
/etc/motd:
  file.symlink:
    - users: root
    - group: admins
    - mode: "0600"
    - force: True
    - target: /etc/motd.tail
/etc/issue:
  file.managed:
    - users: root
    - group: root
    - mode: "0644"
    - source: salt://shell/files/issue
/root/:
  file.directory:
    - users: root
    - group: admins
    - mode: "0700"

