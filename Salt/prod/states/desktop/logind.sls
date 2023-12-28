/etc/systemd/logind.conf.d:
  file.directory:
    - users: root
    - group: root
    - mode: "0644"

/etc/systemd/logind.conf.d/options.conf:
  file.managed:
    - users: root
    - group: root
    - mode: "0644"
    - dir_mode: "0644"
    - source: salt://desktop/files/logind.conf
