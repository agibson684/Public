#just setting the autologin for now 
/etc/lightdm/lightdm.conf:
  file.managed:
    - source: 
      - 'salt://desktop/files/lightdm.conf'
    - user: root
    - group: root 
    - mode: '0644'
/home/kodi/.kodi/userdata/profiles/kodi/sources.xml:
  file.managed:
    - source: 
      - salt://desktop/files/{{ salt['pillar.get']('kodi:sources') }}
    - user: kodi
    - group: kodi 
    - mode: '0644'
/home/kodi/.kodi/userdata/sources.xml:
  file.managed:
    - source: 
      - salt://desktop/files/{{ salt['pillar.get']('kodi:sources') }}
    - user: kodi
    - group: kodi 
    - mode: '0644'
/home/kodi/.kodi/userdata/profiles.xml:
  file.managed:
    - source: 
      - salt://desktop/files/{{ salt['pillar.get']('kodi:profiles') }}
    - user: kodi
    - group: kodi 
    - mode: '0644'
Media-10-Monitor.conf:
  file.managed:
    - name: /etc/X11/xorg.conf.d/10-Monitor.conf
    - source: 
      - salt://desktop/files/{{ salt['pillar.get']('kodi:monitor') }}
    - user: root
    - group: root 
    - mode: '0644'
{% if grains['host'] != 'kodi' %}
/home/kodi/.kodi/userdata/playlists/:
 file.recurse:
   - source: 
     - salt://desktop/files/playlists/
   - user: kodi
   - group: kodi
   - file_mode: '0777'
   - dir_mode: '0777'
   - clean: true 
{% endif %}






