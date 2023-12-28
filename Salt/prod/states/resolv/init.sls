resolv-file:
  file.managed:
    - user: root
    - group: root
    - mode: 644
    - names:
      - /etc/resolv.conf:
        - source: salt://resolv/files/resolv.conf
