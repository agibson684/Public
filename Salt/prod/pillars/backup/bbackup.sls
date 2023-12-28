bbackup_types:
  BACKUP_ARIES:
    path: '/opt/scripts'
    bksource: "/pool/BACKUP/aries/monthly/" 
    log: '/var/log/backup.log'
    bkdest: 'b2://backups684/aries/'
    logerror: '/var/log/backup-error.log'
    commands: 'sync'
    params: '4'
    keepdays: '90'
  BACKUP_CALISTO:
    path: '/opt/scripts'
    bksource: "/pool/BACKUP/calisto/monthly/" 
    log: '/var/log/backup.log'
    bkdest: 'b2://backups684/calisto/'
    logerror: '/var/log/backup-error.log'
    commands: 'sync'
    params: '4'
    keepdays: '90'
#  BACKUP_CYANE:
#    path: '/opt/scripts'
#    bksource: "/pool/BACKUP/cyane/" 
#    log: '/var/log/backup.log'
#    bkdest: 'b2://backups684/cyane/'
#    logerror: '/var/log/backup-error.log'
#    commands: 'sync'
#    params: '4'
#  BACKUP_EPHINY:
#    path: '/opt/scripts'
#    bksource: "/pool/BACKUP/ephiny/monthly" 
#    log: '/var/log/backup.log'
#    bkdest: 'b2://backups684/ephiny/'
#    logerror: '/var/log/backup-error.log'
#    commands: 'sync'
#    params: '4'
  BACKUP_GABRIELLE:
    path: '/opt/scripts'
    bksource: "/pool/BACKUP/gabrielle/monthly/" 
    log: '/var/log/backup.log'
    bkdest: 'b2://backups684/gabrielle/'
    logerror: '/var/log/backup-error.log'
    commands: 'sync'
    params: '4'
    keepdays: '90'
#  BACKUP_HIPPOLYTA:
#    path: '/opt/scripts'
#    bksource: "/pool/BACKUP/hippolyta/" 
#    log: '/var/log/backup.log'
#    bkdest: 'b2://backups684/hippolyta/'
#    logerror: '/var/log/backup-error.log'
#    commands: 'sync'
#    params: '4'
  BACKUP_MEDIACENTER:
    path: '/opt/scripts'
    bksource: "/pool/BACKUP/mediacenter/monthly/" 
    log: '/var/log/backup.log'
    bkdest: 'b2://backups684/mediacenter/'
    logerror: '/var/log/backup-error.log'
    commands: 'sync'
    params: '4'
    keepdays: '90'
  BACKUP_SOLAN:
    path: '/opt/scripts'
    bksource: "/pool/BACKUP/solan/monthly/" 
    log: '/var/log/backup.log'
    bkdest: 'b2://backups684/solan/'
    logerror: '/var/log/backup-error.log'
    commands: 'sync'
    params: '4'
    keepdays: '90'
  BACKUP_TERREIS:
    path: '/opt/scripts'
    bksource: "/pool/BACKUP/terreis/monthly/" 
    log: '/var/log/backup.log'
    bkdest: 'b2://backups684/terreis/'
    logerror: '/var/log/backup-error.log'
    params: '4'
    commands: 'sync'
    keepdays: '90'
  BACKUP_XENA:
    path: '/opt/scripts'
    bksource: "/pool/BACKUP/xena/monthly/" 
    log: '/var/log/backup.log'
    bkdest: 'b2://backups684/xena/'
    logerror: '/var/log/backup-error.log'
    commands: 'sync'
    params: '4'
    keepdays: '90'
  APP:
    path: '/opt/scripts'
    bksource: "/pool/APPS"
    log: '/var/log/backup.log'
    bkdest: 'b2://APP684/{{ grains['host'] }}'
    logerror: '/var/log/backup-error.log'
    commands: 'sync'
    params: '4'
    keepdays: '365'
  MISC:
    path: '/opt/scripts'
    bksource: "/pool/MISC" 
    log: '/var/log/backup.log'
    bkdest: 'b2://MISC684/{{ grains['host'] }}'
    logerror: '/var/log/backup-error.log'
    commands: 'sync'
    params: '4'
    keepdays: '365'
  TV:
    path: '/opt/scripts'
    bksource: "/pool/TV_SHOWS/" 
    log: '/var/log/backup.log'
    bkdest: 'b2://TVSHOWS684/{{ grains['host'] }}'
    logerror: '/var/log/backup-error.log'
    commands: 'sync'
    params: '4'
    keepdays: '365'
  MOVIE:
    path: '/opt/scripts'
    bksource: "/pool/MOVIES" 
    log: '/var/log/backup.log'
    bkdest: 'b2://MOVIES684/{{ grains['host'] }}'
    logerror: '/var/log/backup-error.log'
    commands: 'sync'
    params: '4'
    keepdays: '365'
