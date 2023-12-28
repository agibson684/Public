mpd:
  pkg:
    - installed
mpd-service:
  service.running:
    - name: mpd
    
/etc/mpd.conf:
  file.managed:
    - user: root
    - group: root
    - mode: "0644"
    - template: jinja 
    - source: salt://mpd/files/mpd.conf
