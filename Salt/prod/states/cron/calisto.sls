{% if grains['host'] == 'calisto' %}
lxc-reboot-start:
  cron.absent:
    - name: "/usr/bin/lxc-start --name aries -d >/dev/null 2>&1"
    - user: root
    - special: '@reboot'
lxc-reboot-start-lyceus:
  cron.absent:
    - name: "/usr/bin/lxc-start --name lyceus -d >/dev/null 2>&1"
    - user: root
    - special: '@reboot'
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
#shutting this off for now while gaby is being worked on
sync-files-gabrielle-calisto:
  cron.absent:
    - name: /opt/scripts/sync-files-gabrielle-calisto.sh > /dev/null 2>&1
    - user: root
    - minute: 0
    - hour: '*/1'
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
