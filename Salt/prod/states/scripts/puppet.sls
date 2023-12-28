scripts-puppet:
  file.absent:
    - user: root
    - group: admins
    - mode: 750
    - names:
      - /opt/scripts/puppet-summary.sh:
        - source: salt://scripts/files/puppet-summary.sh
