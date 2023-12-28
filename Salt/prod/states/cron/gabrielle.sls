{% if grains['host'] == 'gabrielle' %}
{% set torrent_syncbox_enable = "absent" %}
{% set torrent_syncnas_enable = "absent" %}
flexget-cron:
  cron.{{ torrent_syncbox_enable }}:
    - name: /opt/scripts/flexget-execute.sh  >/dev/null 2>&1
    - user: erin
    - minute: 0
    - hour: '*/1'
sync_seedbox:
  cron.{{torrent_syncnas_enable }}:
    - name: /usr/bin/python3 /opt/scripts/push-downloads-movies-tv.py sync_box >/dev/null 2>&1
    - user: root
    - minute: '*/10' 
{#    - hour: '*/12' #}
push-downloads-movies-tv-sh:
  cron.{{torrent_syncnas_enable }}:
    - name: /usr/bin/python3 /opt/scripts/push-downloads-movies-tv.py main >/dev/null  2>&1
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
zpool-scrub-pool:
  cron.present:
    - name: /sbin/zpool scrub pool >/dev/null 2>&1
    - user: root
    - minute: 0
    - hour: 0
    - dayweek: '*/6'
changefolder:
  cron.present:
    - name: /opt/scripts/change-folder.sh > /dev/null  2>&1
    - user: root
    - minute: 0
    - hour:  0
    - dayweek: 6
clean-backups:
  cron.present:
    - name: /opt/scripts/clean-up-backups.sh > /dev/null  2>&1
    - user: root
    - minute: 40
    - hour: 3
    - dayweek: '*/1'
zpool-import-pool:
  cron.present:
    - name: /sbin/zpool import pool >/dev/null 2>&1
    - user: root
    - special: '@reboot'
zfs-auto-snapshot-hourly:
  cron.present:
    - name: /opt/scripts/zfs-auto-snapshot.hourly >/dev/null 2>&1
    - user: root
    - minute: 0
    - hour: '*/1'
zfs-auto-snapshot-daily:
  cron.present:
    - name: /opt/scripts/zfs-auto-snapshot.daily >/dev/null 2>&1
    - user: root
    - minute: 0
    - hour: 0
    - dayweek: '*/1'
zfs-auto-snapshot-weekly:
  cron.present:
    - name: /opt/scripts/zfs-auto-snapshot.weekly >/dev/null 2>&1
    - user: root
    - minute: 0
    - hour: 0
    - dayweek: '*/7'
zfs-auto-snapshot-monthly:
  cron.present:
    - name: /opt/scripts/zfs-auto-snapshot.monthly >/dev/null 2>&1
    - user: root
    - minute: 0
    - hour: 0
    - daymonth: '*/30'
pull-backups:
  cron.present:
    - name: /opt/scripts/pull-backups.sh > /dev/null  2>&1
    - user: root
    - minute: 0
    - hour: '*/2'
fix-backups:
  cron.present:
    - name: /opt/scripts/fix-backups.sh > /dev/null  2>&1
    - user: root
    - minute: 0
    - hour: 0
    - dayweek: '*/6'
/etc/cron.d/zfs-auto-snapshot:
  file.managed:
    - users: root
    - group: root
    - mode: "0755"
    - source: salt://cron/files/zfs-auto-snapshot.cron.frequent
sync-camera-sh:
  cron.absent:
    - name: /opt/scripts/sync-camera.sh >/dev/null 2>&1
    - user: root
    - minute: '*/10'
clean-camera-sh:
  cron.absent:
    - name: /opt/scripts/clean-camera.sh >/dev/null 2>&1
    - user: root
    - minute: '10'
    - hour: 0
    - dayweek: '*/5'
{% else %}
{% endif %}
