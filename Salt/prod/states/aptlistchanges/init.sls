apt.packages:
  pkg.installed:
    - pkgs:
      - apt-listchanges
apt.removal:
  pkg.removed:
    - pkgs:
      - apt-listbugs
listchanges-files:
  file.managed:
    - user: root
    - group: root
    - mode: 0644
    - names:
      - /etc/apt/listchanages.conf:
        - source: salt://aptlistchanges/files/listchanges.conf




