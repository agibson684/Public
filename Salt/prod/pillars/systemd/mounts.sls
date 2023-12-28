systemd:
  mount:
    media-files_movies:
      status: stop
      Unit:
        Description: 'Mount Share at boot'
        Requires: 'NetworkManager.service'
        After: 'network-online.target'
        Wants: 'network-online.target'
      Mount:
        What: '//gabrielle.thrace.lan/MOVIES'
        Where: '/media/files_movies'
        Options: 'password="",iocharset=utf8,rw,x-systemd.automount,uid=0,gid=0,file_mode=0755,dir_mode=0755,vers=3.0'
        Type: 'cifs'
        TimeoutSec: '5'
      Install:
        WantedBy: 'multi-user.target'
    media-files_music:
      status: stop
      Unit: 
        Description: 'Mount Share at boot'
        Requires: 'NetworkManager.service'
        After: 'network-online.target'
        Wants: 'network-online.target'
      Mount: 
        What: '//gabrielle.thrace.lan/MUSIC'
        Where: '/media/files_music'
        Options: 'password="",iocharset=utf8,rw,x-systemd.automount,uid=0,gid=0,file_mode=0755,dir_mode=0755,vers=3.0'
        Type: 'cifs'
        TimeoutSec: '5'
      Install:
        WantedBy: 'multi-user.target'
    media-files_apps:
      status: stop
      Unit:
        Description: 'Mount Share at boot'
        Requires:  'NetworkManager.service'
        After: 'network-online.target'
        Wants: 'network-online.target'
      Mount:
        What: '//gabrielle.thrace.lan/APPS'
        Where: '/media/files_apps'
        Options: 'password="",iocharset=utf8,rw,x-systemd.automount,uid=0,gid=0,file_mode=0755,dir_mode=0755,vers=3.0'
        Type: 'cifs'
        TimeoutSec: '5'
      Install: 
        WantedBy:  'multi-user.target'
    media-files_misc:
      status: stop
      Unit:
        Description: 'Mount Share at boot'
        Requires: 'NetworkManager.service'
        After: 'network-online.target'
        Wants: 'network-online.target'
      Mount:
        What: '//gabrielle.thrace.lan/MISC'
        Where: '/media/files_misc'
        Options: 'password="",iocharset=utf8,rw,x-systemd.automount,uid=0,gid=0,file_mode=0755,dir_mode=0755,vers=3.0'
        Type: 'cifs'
        TimeoutSec: '5'
      Install:
        WantedBy: 'multi-user.target'
    media-private:
      status: stop
      Unit:
        Description: 'Mount Share at boot'
        Requires: 'NetworkManager.service'
        After: 'network-online.target'
        Wants: 'network-online.target'
      Mount:
        What: '//gabrielle.thrace.lan/PRIVATE'
        Where: '/media/private'
        Options:  'password="",iocharset=utf8,rw,x-systemd.automount,uid=0,gid=0,file_mode=0755,dir_mode=0755,vers=3.0'
        Type: 'cifs'
        TimeoutSec: '5'
      Install:
        WantedBy: 'multi-user.target'
    media-backup:
      status: stop
      Unit:
        Description: 'Mount Share at boot'
        Requires: 'NetworkManager.service'
        After: 'network-online.target'
        Wants: 'network-online.target'
      Mount:
        What:  '//gabrielle.thrace.lan/BACKUP'
        Where:  '/media/backup'
        Options: 'password="",iocharset=utf8,rw,x-systemd.automount,uid=0,gid=0,file_mode=0777,dir_mode=0755,vers=3.0'
        Type: 'cifs'
        TimeoutSec: '5'
      Install:
        WantedBy: 'multi-user.target'
    media-downloads:
      status: stop
      Unit: 
        Description: 'Mount Share at boot'
        Requires: 'NetworkManager.service'
        After: 'network-online.target'
        Wants: 'network-online.target'
      Mount:
        What:   '//gabrielle.thrace.lan/DOWNLOADS'
        Where: '/media/downloads'
        Options: 'password="",iocharset=utf8,rw,x-systemd.automount,uid=0,gid=0,file_mode=0777,dir_mode=0777,vers=3.0'
        Type: 'cifs'
        TimeoutSec: '5'
      Install:
        WantedBy: 'multi-user.target'
    media-complete:
      status: stop
      Unit:
        Description: 'Mount Share at boot'
        Requires: 'NetworkManager.service'
        After: 'network-online.target'
        Wants: 'network-online.target'
      Mount:
        What: '//gabrielle.thrace.lan/COMPLETE'
        Where: '/media/complete'
        Options: 'password="",iocharset=utf8,rw,x-systemd.automount,uid=0,gid=0,file_mode=0777,dir_mode=0777,vers=3.0'
        Type: 'cifs'
        TimeoutSec: '5'
      Install:
        WantedBy:  'multi-user.target'
    media-sync_downloads:
      status: start
      Unit:
        Description: 'Mount Share at boot'
        Requires: 'NetworkManager.service'
        After:  'network-online.target'
        Wants: 'network-online.target'
      Mount:
        What: '//calisto.thrace.lan/DOWNLOADS'
        Where: '/media/sync_downloads'
        Options: 'password="",iocharset=utf8,rw,x-systemd.automount,uid=0,gid=0,file_mode=0777,dir_mode=0777,vers=3.0 '
        Type: 'cifs'
        TimeoutSec: '5'
      Install:
        WantedBy: 'multi-user.target'
    media-sync_complete:
      status: start
      Unit:
        Description: 'Mount Share at boot'
        Requires: 'NetworkManager.service'
        After: 'network-online.target'
        Wants: 'network-online.target'
      Mount:    
        What:  '//calisto.thrace.lan/COMPLETE'
        Where: '/media/sync_complete'
        Options: 'password="",iocharset=utf8,rw,x-systemd.automount,uid=0,gid=0,file_mode=0777,dir_mode=0777,vers=3.0 '
        Type: 'cifs'
        TimeoutSec: '5'
      Install:
        WantedBy:  'multi-user.target'
    media-sync_backup:
      status: start
      Unit:
        Description: 'Mount Share at boot'
        Requires: 'NetworkManager.service'
        After: 'network-online.target'
        Wants: 'network-online.target'
      Mount:
        What:  '//calisto.thrace.lan/BACKUP'
        Where: '/media/sync_backup'
        Options: 'password="",iocharset=utf8,rw,x-systemd.automount,uid=0,gid=0,file_mode=0777,dir_mode=0777,vers=3.0 '
        Type: 'cifs'
        TimeoutSec: '5'
      Install:
        WantedBy: 'multi-user.target'
    media-sync_private:
      status: start
      Unit:
        Description: 'Mount Share at boot'
        Requires: 'NetworkManager.service'
        After: 'network-online.target'
        Wants: 'network-online.target'
      Mount:
        What: '//calisto.thrace.lan/PRIVATE'
        Where: '/media/sync_private'
        Options: 'password="",iocharset=utf8,rw,x-systemd.automount,uid=0,gid=0,file_mode=0755,dir_mode=0755,vers=3.0 '
        Type: 'cifs'
        TimeoutSec: '5'
      Install:
        WantedBy:  'multi-user.target'
    media-sync_movies:
      status: start
      Unit:  
        Description: 'Mount Share at boot'
        Requires: 'NetworkManager.service'
        After: 'network-online.target'
        Wants: 'network-online.target'
      Mount:
        What:  '//calisto.thrace.lan/MOVIES'
        Where: '/media/sync_movies'
        Options: 'password="",iocharset=utf8,rw,x-systemd.automount,uid=0,gid=0,file_mode=0755,dir_mode=0755,vers=3.0 '
        Type: 'cifs'
        TimeoutSec: '5'
      Install:
        WantedBy: 'multi-user.target'
    media-sync_music:
      status: start
      Unit:
        Description: 'Mount Share at boot'
        Requires: 'NetworkManager.service'
        After: 'network-online.target'
        Wants: 'network-online.target'
      Mount:
        What: '//calisto.thrace.lan/MUSIC'
        Where: '/media/sync_music'
        Options: 'password="",iocharset=utf8,rw,x-systemd.automount,uid=0,gid=0,file_mode=0755,dir_mode=0755,vers=3.0 '
        Type: 'cifs'
        TimeoutSec: '5'
      Install:
        WantedBy:  'multi-user.target'
    media-sync_apps:
      status: start
      Unit:
        Description: 'Mount Share at boot'
        Requires: 'NetworkManager.service'
        After: 'network-online.target'
        Wants: 'network-online.target'
      Mount:
        What: '//calisto.thrace.lan/APPS'
        Where: '/media/sync_apps'
        Options: 'password="",iocharset=utf8,rw,x-systemd.automount,uid=0,gid=0,file_mode=0755,dir_mode=0755,vers=3.0 '
        Type: 'cifs'
        TimeoutSec: '5'
      Install:
        WantedBy:  'multi-user.target'
    media-sync_misc:
      status: start
      Unit:
        Description: 'Mount Share at boot'
        Requires: 'NetworkManager.service'
        After: 'network-online.target'
        Wants: 'network-online.target'
      Mount:
        What: '//calisto.thrace.lan/MISC'
        Where: '/media/sync_misc'
        Options: 'password="",iocharset=utf8,rw,x-systemd.automount,uid=0,gid=0,file_mode=0755,dir_mode=0755,vers=3.0 '
        Type: 'cifs'
        TimeoutSec: '5'
      Install:
        WantedBy: 'multi-user.target'
    media-sync_tv:
      status: start
      Unit:
        Description: 'Mount Share at boot'
        Requires: 'NetworkManager.service'
        After: 'network-online.target'
        Wants: 'network-online.target'
      Mount:
        What: '//calisto.thrace.lan/TV_SHOW'
        Where: '/media/sync_tv'
        Options: 'password="",iocharset=utf8,rw,x-systemd.automount,uid=0,gid=0,file_mode=0755,dir_mode=0755,vers=3.0 '
        Type: 'cifs'
        TimeoutSec: '5'
      Install:
        WantedBy: 'multi-user.target'
    media-tv:
      status: start
      Unit:
        Description: 'Mount Share at boot'
        Requires: 'NetworkManager.service'
        After: 'network-online.target'
        Wants: 'network-online.target'
      Mount:
        What: '//gabrielle.thrace.lan/TV_SHOW'
        Where: '/media/tv'
        Options: 'password="",iocharset=utf8,rw,x-systemd.automount,uid=0,gid=0,file_mode=0755,dir_mode=0755,vers=3.0 '
        Type: 'cifs'
        TimeoutSec: '5'
      Install:
        WantedBy: 'multi-user.target'
    media-BITTORRENT:
      status: start
      Unit:
        Description: 'Mount Share at boot'
        Requires: 'NetworkManager.service'
        After: 'network-online.target'
        Wants: 'network-online.target'
      Mount:
        What: '//docker.thrace.lan/BITTORRENT'
        Where: '/media/BITTORRENT'
        Options: 'password="",iocharset=utf8,rw,x-systemd.automount,uid=0,gid=0,file_mode=0777,dir_mode=0777,vers=3.0 '
        Type: 'cifs'
        TimeoutSec: '5'
      Install:
        WantedBy: 'multi-user.target'
    mnt-windows:
      status: start
      Unit:
        Description: 'Mount windows'
      Mount:
        What: '/dev/disk/by-uuid/BADC3106DC5BE87'
        Where: '/mnt/windows'
        Options: 'rw,x-systemd.automount'
        Type: 'ntfs'
        TimeoutSec: '5'
      Install:
        WantedBy: 'multi-user.target'  









