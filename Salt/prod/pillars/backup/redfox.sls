backup_types:
  day:
    path: '/opt/scripts'
    backup: "/media/Videos/backup/{{ grains['host'] }}/backup.day.$(date +%Y-%m-%d).tar.bz2"
    log: '/var/log/backup.log'
    exclude: 'exclude_redfox.txt'
    logerror: '/var/log/backup-error.log'
    folders: ['etc', 'root', 'home', 'usr/share/applications', 'srv']
    function_check_windows_mount: false
    folders_games: ''
  week:
    path: '/opt/scripts'
    backup: "/media/Videos/backup/{{ grains['host'] }}/backup.week.$(date +%Y-%m-%d).tar.bz2"
    log: '/var/log/backup.log'
    exclude: 'exclude_redfox.txt'
    logerror: '/var/log/backup-error.log'
    folders: ['etc', 'root', 'home', 'usr/share/applications']
    function_check_windows_mount: false
    folders_games: ''
  month:
    path: '/opt/scripts'
    backup: "/media/Videos/backup/{{ grains['host'] }}/backup.month.$(date +%Y-%m-%d).tar.bz2"
    log: '/var/log/backup.log'
    exclude: 'exclude_redfox.txt'
    logerror: '/var/log/backup-error.log'
    folders: ['etc', 'root', 'home', 'usr/share/applications']
    function_check_windows_mount: false
    folders_games: ''

