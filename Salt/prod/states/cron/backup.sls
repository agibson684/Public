{% if grains['host'] == 'gabrielle' %}
backup-day:
  cron.present:
    - name: /opt/scripts/backup.day.sh > /var/log/backup.log 2>&1  
    - user: root
    - minute: 0
    - hour: 0

backup-week:
  cron.present:
    - name: /opt/scripts/backup.week.sh > /var/log/backup.log 2>&1
    - user: root
    - minute: 0
    - hour: 12
    - dayweek: 0

backup-month:
  cron.present:
    - name: /opt/scripts/backup.month.sh > /var/log/backup.log 2>&1
    - user: root
    - minute: 0
    - hour: 6
    - daymonth: 4
    - dayweek: 0
backup-tv:
  cron.absent:
    - name: /opt/scripts/backup.TV.sh > /var/log/backup.log 2>&1
    - user: root
    - minute: 0
    - hour: 10
    - daymonth: 4
    - dayweek: 1 
backup-aries:
  cron.present:
    - name: /opt/scripts/backup.BACKUP_ARIES.sh > /var/log/backup.log 2>&1
    - user: root
    - minute: 0
    - hour: 10
    - daymonth: 1 
    - dayweek: 0
backup-calisto:
  cron.present:
    - name: /opt/scripts/backup.BACKUP_CALISTO.sh > /var/log/backup.log 2>&1
    - user: root
    - minute: 0
    - hour: 10
    - daymonth: 2 
    - dayweek: 0
ackup-gabrielle:
  cron.present:
    - name: /opt/scripts/backup.BACKUP_GABRIELLE.sh > /var/log/backup.log 2>&1
    - user: root
    - minute: 0
    - hour: 10
    - daymonth: 3 
    - dayweek: 0
backup-MEDIACENTER:
  cron.present:
    - name: /opt/scripts/backup.BACKUP_MEDIACENTER.sh > /var/log/backup.log 2>&1
    - user: root
    - minute: 0
    - hour: 10
    - daymonth: 5 
    - dayweek: 0
backup-solan:
  cron.present:
    - name: /opt/scripts/backup.BACKUP_SOLAN.sh > /var/log/backup.log 2>&1
    - user: root
    - minute: 0
    - hour: 10
    - daymonth: 6 
    - dayweek: 0
backup-terreis:
  cron.present:
    - name: /opt/scripts/backup.BACKUP_TERREIS.sh > /var/log/backup.log 2>&1
    - user: root
    - minute: 0
    - hour: 10
    - daymonth: 7 
    - dayweek: 0
backup-xena:
  cron.present:
    - name: /opt/scripts/backup.BACKUP_XENA.sh > /var/log/backup.log 2>&1
    - user: root
    - minute: 0
    - hour: 10
    - daymonth: 8 
    - dayweek: 0

{% elif grains['host'] == 'xena' %}

backup-day:
  cron.present:
    - name: /opt/scripts/backup.day.sh > /var/log/backup.log 2>&1
    - user: root
    - minute: 0
    - hour: 2

backup-week:
  cron.present:
    - name: /opt/scripts/backup.week.sh > /var/log/backup.log 2>&1
    - user: root
    - minute: 0
    - hour: 12
    - dayweek: 0

backup-month:
  cron.present:
    - name: /opt/scripts/backup.month.sh > /var/log/backup.log 2>&1
    - user: root
    - minute: 0
    - hour: 16
    - daymonth: 4
    - dayweek: 0

{% elif grains['host'] == 'calisto' %}

backup-movies:
  cron.absent:
    - name: /opt/scripts/backup.MOVIE.sh > /var/log/backup.log 2>&1
    - user: root
    - minute: 0
    - hour: 10
    - daymonth: 20 
    - dayweek: 0


backup-day:
  cron.present:
    - name: /opt/scripts/backup.day.sh > /var/log/backup.log 2>&1
    - user: root
    - minute: 0
    - hour: 2

backup-week:
  cron.present:
    - name: /opt/scripts/backup.week.sh > /var/log/backup.log 2>&1
    - user: root
    - minute: 0
    - hour: 12
    - dayweek: 0

backup-month:
  cron.present:
    - name: /opt/scripts/backup.month.sh > /var/log/backup.log 2>&1
    - user: root
    - minute: 0
    - hour: 16
    - daymonth: 4
    - dayweek: 0


{% elif grains['host'] == 'solan' %}

backup-day:
  cron.present:
    - name: /opt/scripts/backup.day.sh > /var/log/backup.log 2>&1
    - user: root
    - minute: 0
    - hour: 9

backup-week:
  cron.present:
    - name: /opt/scripts/backup.week.sh > /var/log/backup.log 2>&1
    - user: root
    - minute: 0
    - hour: 23
    - dayweek: 5

backup-month:
  cron.present:
    - name: /opt/scripts/backup.month.sh > /var/log/backup.log 2>&1
    - user: root
    - minute: 0
    - hour: 18
    - daymonth: 4

{% elif grains['host'] == 'lyceus' %}

backup-day:
  cron.present:
    - name: /opt/scripts/backup.day.sh > /var/log/backup.log 2>&1
    - user: root
    - minute: 0
    - hour: 7

backup-week:
  cron.present:
    - name: /opt/scripts/backup.week.sh > /var/log/backup.log 2>&1
    - user: root
    - minute: 0
    - hour: 2
    - dayweek: 0

backup-month:
  cron.present:
    - name: /opt/scripts/backup.month.sh > /var/log/backup.log 2>&1
    - user: root
    - minute: 0
    - hour: 8
    - daymonth: 7

{% elif grains['host'] == 'aries' %}
backup-day:
  cron.present:
    - name: /opt/scripts/backup.day.sh > /var/log/backup.log 2>&1
    - user: root
    - minute: 0
    - hour: 8

backup-week:
  cron.present:
    - name: /opt/scripts/backup.week.sh > /var/log/backup.log 2>&1
    - user: root
    - minute: 0
    - hour: 1
    - dayweek: 0

backup-month:
  cron.present:
    - name: /opt/scripts/backup.month.sh > /var/log/backup.log 2>&1
    - user: root
    - minute: 0
    - hour: 9
    - daymonth: 8
{% elif grains['host'] == 'ephiny' %}
backup-day:
  cron.present:
    - name: /opt/scripts/backup.day.sh > /var/log/backup.log 2>&1
    - user: root
    - minute: 0
    - hour: 8

backup-week:
  cron.present:
    - name: /opt/scripts/backup.week.sh > /var/log/backup.log 2>&1
    - user: root
    - minute: 0
    - hour: 1
    - dayweek: 0

backup-month:
  cron.present:
    - name: /opt/scripts/backup.month.sh > /var/log/backup.log 2>&1
    - user: root
    - minute: 0
    - hour: 9
    - daymonth: 8
{% elif grains['host'] == 'athena' %}
backup-pull:
  cron.present:
    - name: /opt/scripts/pull-backups-remote.sh > /var/log/backup.log 2>&1
    - user: root
    - minute: 40
    - hour: */1

backup-day:
  cron.present:
    - name: /opt/scripts/backup.day.sh > /var/log/backup.log 2>&1
    - user: root
    - minute: 0
    - hour: 8

backup-week:
  cron.present:
    - name: /opt/scripts/backup.week.sh > /var/log/backup.log 2>&1
    - user: root
    - minute: 0
    - hour: 1
    - dayweek: 0

backup-month:
  cron.present:
    - name: /opt/scripts/backup.month.sh > /var/log/backup.log 2>&1
    - user: root
    - minute: 0
    - hour: 9
    - daymonth: 8
{% elif grains['host'] == 'hades' %}

backup-day:
  cron.present:
    - name: /opt/scripts/backup.day.sh > /var/log/backup.log 2>&1
    - user: root
    - minute: 0
    - hour: 8

backup-week:
  cron.present:
    - name: /opt/scripts/backup.week.sh > /var/log/backup.log 2>&1
    - user: root
    - minute: 0
    - hour: 1
    - dayweek: 0

backup-month:
  cron.present:
    - name: /opt/scripts/backup.month.sh > /var/log/backup.log 2>&1
    - user: root
    - minute: 0
    - hour: 9
    - daymonth: 8
{% elif grains['host'] == 'terreis' %}

backup-day:
  cron.present:
    - name: /opt/scripts/backup.day.sh > /var/log/backup.log 2>&1
    - user: root
    - minute: 0
    - hour: 8

backup-week:
  cron.present:
    - name: /opt/scripts/backup.week.sh > /var/log/backup.log 2>&1
    - user: root
    - minute: 0
    - hour: 1
    - dayweek: 0

backup-month:
  cron.present:
    - name: /opt/scripts/backup.month.sh > /var/log/backup.log 2>&1
    - user: root
    - minute: 0
    - hour: 9
    - daymonth: 8

backup-eq:
  cron.present:
    - name: "/opt/scripts/backup.eq.sh  -no_backup_mount  >/var/log/backup.log 2>&1"
    - user: root
    - minute: 15
    - hour: 5

backup-eq2:
  cron.present:
    - name: "/opt/scripts/backup.eq2.sh  -no_backup_mount  >/var/log/backup.log 2>&1"
    - user: root
    - minute: 15
    - hour: 3

backup-eqw:
  cron.present:
    - name: "/opt/scripts/backup.eqw.sh  -no_backup_mount  >/var/log/backup.log 2>&1"
    - user: root
    - minute: 05
    - hour: 2

backup-eqw2:
  cron.present:
    - name: "/opt/scripts/backup.eqw2.sh  -no_backup_mount  >/var/log/backup.log 2>&1"
    - user: root
    - minute: 45
    - hour: 8

{% elif grains['host'] == 'cyane' %}

backup-day:
  cron.absent:
    - name: /opt/scripts/backup.day.sh > /var/log/backup.log 2>&1
    - user: root
    - minute: 0
    - hour: 8

backup-week:
  cron.absent:
    - name: /opt/scripts/backup.week.sh > /var/log/backup.log 2>&1
    - user: root
    - minute: 0
    - hour: 1
    - dayweek: 0

backup-month:
  cron.absent:
    - name: /opt/scripts/backup.month.sh > /var/log/backup.log 2>&1
    - user: root
    - minute: 0
    - hour: 9
    - daymonth: 8
{% elif grains['host'] == 'docker' %}

backup-day:
  cron.present:
    - name: /opt/scripts/backup.day.sh > /var/log/backup.log 2>&1
    - user: root
    - minute: 30
    - hour: 9

backup-week:
  cron.present:
    - name: /opt/scripts/backup.week.sh > /var/log/backup.log 2>&1
    - user: root
    - minute: 0
    - hour: 1
    - dayweek: 1

backup-month:
  cron.present:
    - name: /opt/scripts/backup.month.sh > /var/log/backup.log 2>&1
    - user: root
    - minute: 0
    - hour: 12
    - daymonth: 6

{% elif grains['host'] == 'mediacenter' %}

backup-day:
  cron.present:
    - name: /opt/scripts/backup.day.sh > /var/log/backup.log 2>&1
    - user: root
    - minute: 30
    - hour: 10

backup-week:
  cron.present:
    - name: /opt/scripts/backup.week.sh > /var/log/backup.log 2>&1
    - user: root
    - minute: 0
    - hour: 5
    - dayweek: 1

backup-month:
  cron.present:
    - name: /opt/scripts/backup.month.sh > /var/log/backup.log 2>&1
    - user: root
    - minute: 0
    - hour: 12
    - daymonth: 3



{% else %}
backup-day:
  cron.present:
    - name: /opt/scripts/backup.day.sh > /var/log/backup.log 2>&1
    - user: root
    - minute: 0
    - hour: 8

backup-week:
  cron.present:
    - name: /opt/scripts/backup.week.sh > /var/log/backup.log 2>&1
    - user: root
    - minute: 0
    - hour: 1
    - dayweek: 0

backup-month:
  cron.present:
    - name: /opt/scripts/backup.month.sh > /var/log/backup.log 2>&1
    - user: root
    - minute: 0
    - hour: 9
    - daymonth: 8
{% endif %}
