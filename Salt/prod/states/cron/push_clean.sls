{% set torrent_syncbox_enable = "present" %}
{% set torrent_syncnas_enable = "present" %}
sync_seedbox:
  cron.{{torrent_syncnas_enable }}:
    - name:  /opt/scripts/push-downloads-movies-tv.py sync_box >/dev/null 2>&1
    - user: root
    - minute: '*/20' 
{#    - hour: '*/12' #}
push-downloads-movies-tv-sh:
  cron.{{torrent_syncnas_enable }}:
    - name:  /opt/scripts/push-downloads-movies-tv.py main >/dev/null  2>&1
    - user: root
    - minute: 01
    - hour: '*/1'
clean-up-meta-nas.sh:
  cron.{{torrent_syncnas_enable }}:
    - name: /opt/scripts/clean-up-meta-nas.sh >/dev/null 2>&1
    - user: root
    - minute: 01
    - hour: '*/1'
sort-season.sh:
  cron.{{torrent_syncnas_enable }}:
    - name: /opt/scripts/sort-season.sh >/dev/null 2>&1
    - user: root
    - minute: 01
    - hour: '*/1'

