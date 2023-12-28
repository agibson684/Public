suspend.conf:
  file.managed:
    - name:  /etc/polkit-1/localauthority/50-local.d/manage-units.pkla
    - source: 
      - salt://desktop/files/{{ salt['pillar.get']('polkit:manage-units') }}
    - user: root
    - group: root 
    - mode: '0644'




