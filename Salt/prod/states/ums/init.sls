include:
  - java.openjdk8
  -  repos.adoptopenjdk

ums:
  user:
      - present
  group:
      - present

ums-service:
  service.running:
    - name: ums
    - enable: true 
    - watch: 
      - file: "/home/ums/.config/UMS/UMS.conf"

/usr/local/sbin/ums:
  file.recurse: 
    - user: ums
    - group: ums
    - file_mode: 750
    - dir_mode: 740
    - recurse: 
      - user
      - group
      - mode
    - source: salt://ums/files/ums/

/home/ums/.config:
  file.directory:
    - user: ums
    - group: ums

/home/ums/.config/UMS:
  file.directory: 
    - user: ums 
    - group: ums

/home/ums/.config/UMS/UMS.conf:
  file.managed:  
    - user: ums
    - group: ums 
    - template: jinja    
    - source: salt://ums/files/ums.conf

/etc/systemd/system/ums.service:
  file.managed:
    - user: ums
    - group: ums 
    - template: jinja
    - source: salt://ums/files/ums.service  
