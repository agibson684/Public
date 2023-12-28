backup_types:
  day:
    path: '/opt/scripts'
    backup: "/media/sync_backup/{{ grains['host'] }}/backup.day.$(date +%Y-%m-%d).tar.bz2"
    log: '/var/log/backup.log'
    exclude: 'exclude.txt'
    logerror: '/var/log/backup-error.log'
    folders: ['etc', 'root', 'home', 'usr/share/applications', 'srv']
    function_check_windows_mount: false
    folders_games: ''
  week:
    path: '/opt/scripts'
    backup: "/media/sync_backup/{{ grains['host'] }}/backup.week.$(date +%Y-%m-%d).tar.bz2"
    log: '/var/log/backup.log'
    exclude: 'exclude.txt'
    logerror: '/var/log/backup-error.log'
    folders: ['etc', 'root', 'home', 'usr/share/applications']
    function_check_windows_mount: false
    folders_games: ''
  month:
    path: '/opt/scripts'
    backup: "/media/sync_backup/{{ grains['host'] }}/backup.month.$(date +%Y-%m-%d).tar.bz2"
    log: '/var/log/backup.log'
    exclude: 'exclude.txt'
    logerror: '/var/log/backup-error.log'
    folders: ['etc', 'root', 'home', 'usr/share/applications']
    function_check_windows_mount: false
    folders_games: ''
  eq:
    path: '/opt/scripts'
    backup: "/media/sync_backup/{{ grains['host'] }}/backup.eq.$(date +%Y-%m-%d).tar.bz2"  
    log: '/var/log/backup.log'
    exclude: 'exclude.txt'
    logerror: '/var/log/backup-error.log'
    folders: ['Atlas/Default', 'AudioTriggers', 'backup', 'Logs', 'maps', 'uifiles', 'userdata', 'Screenshots' ]
    function_check_windows_mount: true
    folders_games: '/mnt/windows/Documents\ and\ Settings/Public/Sony\ Online\ Entertainment/Installed\ Games/EverQuest'
  eq2:
    path: '/opt/scripts'
    backup: "/media/sync_backup/{{ grains['host'] }}/backup.eq2.$(date +%Y-%m-%d).tar.bz2"
    log: '/var/log/backup.log'
    exclude: 'exclude.txt'
    logerror: '/var/log/backup-error.log'
    folders: ['Atlas/Default', 'AudioTriggers', 'backup', 'Logs', 'maps', 'uifiles', 'userdata', 'Screenshots']
    function_check_windows_mount: true
    folders_games: '/mnt/windows/Documents\ and\ Settings/Public/Sony\ Online\ Entertainment/Installed\ Games/EverQuest\ -\ Copy/'
  eqw:
    path: '/opt/scripts'
    backup: "/media/sync_backup/{{ grains['host'] }}/backup.eqw.$(date +%Y-%m-%d).tar.bz2"
    log: '/var/log/backup.log'
    exclude: 'exclude.txt'
    logerror: '/var/log/backup-error.log'
    folders: ['mnt/windows/Program\ Files\ \(x86\)/EQWatcher\ Advanced']
    function_check_windows_mount: true
    folders_games: ''
  eqw2:
    path: '/opt/scripts'
    backup: "/media/sync_backup/{{ grains['host'] }}/backup.eqw2.$(date +%Y-%m-%d).tar.bz2"
    log: '/var/log/backup.log'
    exclude: 'exclude.txt'
    logerror: '/var/log/backup-error.log'
    folders: ['mnt/windows/Program\ Files\ \(x86\)/EQWatcher\ Advanced\ -\ ALT']
    function_check_windows_mount: true
    folders_games: ''

