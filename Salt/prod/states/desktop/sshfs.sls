
/mnt/downloads/:
  file.directory
/mnt/misc:
  file.directory
/mnt/misc_vids:
  file.directory
/etc/fuse.conf:
  file.managed:
    - users: root
    - group: root
    - mode: "0644"
    - source: salt://desktop/files/fuse.conf
