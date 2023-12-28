suspend.conf:
  file.managed:
    - name: /etc/X11/xorg.conf.d/10-suspend.conf
    - source: 
      - salt://desktop/files/{{ salt['pillar.get']('xorg:suspend') }}
    - user: root
    - group: root 
    - mode: '0644'
