cfg2html.packages:
  pkg.installed:
    - pkgs:
      - gawk
      - psmisc
cfg2html.package:
  pkg.installed:
    - sources:
      - cfg2html-linux: salt://cfg2html/files/cfg2html-linux.deb
cfg2html-files:
  file.managed:
    - user: root
    - group: root
    - mode: 551
    - template: jinja
    - names:
      - /etc/cfg2html/systeminfo:
        - source: salt://cfg2html/files/systeminfo
      - /etc/cfg2html/files:
        - source: salt://cfg2html/files/cfg2html-files
      - /opt/scripts/cfg2html.sh:
        - source: salt://cfg2html/files/cfg2html.sh
    - require:
      - pkg: cfg2html.packages
