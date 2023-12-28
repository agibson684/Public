/home/kodi/.kodi/userdata/guisettings.xml:
  file.managed:
    - source: 
      - 'salt://desktop/files/{{ salt['pillar.get']('kodi:guisettings') }}'
    - user: kodi
    - group: kodi 
    - mode: '0644'

