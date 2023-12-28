nrpe_packages:
  pkg.installed:
   - pkgs:
     - nagios-nrpe-server
     - nagios-nrpe-plugin
     - nagios-plugins-standard
/etc/nagios:
  file.directory:
  - user: root
  - group: root
  - mode: 740
/etc/nagios-plugins:
  file.directory:
  - user: root
  - group: root
  - mode: 740
/usr/lib/nagios/:
  file.directory:
  - user: root
  - group: root
  - mode: 740
/etc/nagios/nrpe_local.cfg:
  file.managed:
  - user: root
  - group: root
  - mode: 740a
  - source: salt://monitoring-plugins/files/nrpe_local.conf

