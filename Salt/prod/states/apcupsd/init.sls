apcupsd:
  pkg:
    - installed
apcupsd-service:
  service.running:
    - name: apcupsd

/etc/apcupsd/apcupsd.conf:
  file.managed:
    - user: root
    - group: root
    - mode: "0644"
    - template: jinja
    - source: salt://apcupsd/files/apcupsd.conf.erb

/etc/apcupsd/changeme:
  file.managed:
    - user: root
    - group: root
    - mode: "0755"
    - template: jinja
    - source: salt://apcupsd/files/changeme.erb

/etc/apcupsd/commfailure:
  file.managed:
    - user: root
    - group: root
    - mode: "0644"
    - template: jinja
    - source: salt://apcupsd/files/commfailure.erb

/etc/apcupsd/commok:
  file.managed:
    - user: root
    - group: root
    - mode: "0644"
    - template: jinja
    - source: salt://apcupsd/files/commok.erb

/etc/apcupsd/offbattery:
  file.managed:
    - user: root
    - group: root
    - mode: "0644"
    - template: jinja
    - source: salt://apcupsd/files/offbattery.erb

/etc/apcupsd/onbattery:
  file.managed:
    - user: root
    - group: root
    - mode: "0644"
    - template: jinja
    - source: salt://apcupsd/files/onbattery.erb


