/home/THRACE/:
  file.directory:
    - users: root
    - group: root
    - mode: "0755"
/opt/scripts/:
  file.directory:
    - users: root
    - group: admins
    - mode: "0750"
{#
managed my msmtp not shell anymore 
/etc/aliases:
  file.managed:
    - users: root
    - group: root
    - mode: "0755"
    - source: salt://shell/files/aliases
#}
