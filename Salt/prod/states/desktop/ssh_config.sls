/home/erin/.ssh/config:
  file.managed:
    - users: erin
    - group: erin
    - mode: "0700"
    - source: salt://desktop/files/ssh_config
