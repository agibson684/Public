/usr/local/share/fonts/Hacker:
  file.directory:
    - users: root
    - group: root
    - mode: "0777"
    - source: salt://desktop/files/Hacker
fc-cache -fv :
  cmd.run:
    - unless: fc-list | grep Hacker
    - require:
      - file: /usr/local/share/fonts/Hacker
    - runas: erin 
