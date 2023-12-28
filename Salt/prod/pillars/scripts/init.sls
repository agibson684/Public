wrapperscripts:
  ntp:
    command: '/usr/sbin/ntpdate -v -p 5 -u 192.168.1.201'
    user: 'root'
    group: 'root'
    path: '/opt/scripts'
    wrappername: "wrapper-ntp-{{ grains['host'] }}"
    log: '/var/log/wrapper.log'
    logerror: '/var/log/wrapper-error.log'
  zpool-scrub-pool:
    command: '/sbin/zpool scrub pool'
    path: '/opt/scripts'
    user: 'root'
    group: 'root'
    wrappername: "wrapper-pool-{{ grains['host'] }}"
    log: '/var/log/wrapper.log'
    logerror: '/var/log/wrapper-error.log'
  logrotate:
    command: '/usr/sbin/logrotate /etc/logrotate.conf'
    user: 'root'
    group: 'root'
    path: '/opt/scripts'
    wrappername: "wrapper-logrotate-{{ grains['host'] }}"
    log: '/var/log/wrapper.log'
    logerror: '/var/log/wrapper-error.log'
  salt-pull:
    command: 'cd /srv/Salt/ && git pull origin master'
    path: '/opt/scripts'
    user: 'root'
    group: 'root'
    wrappername: "wrapper-salt-{{ grains['host'] }}"
    log: '/var/log/wrapper.log'
    logerror: '/var/log/wrapper-error.log'
  salt-pull-secrects:
    command: 'cd /srv/Salt/salt/ && git pull origin master'
    path: '/opt/scripts'
    user: 'root'
    group: 'root'
    wrappername: "wrapper-salt-{{ grains['host'] }}"
    log: '/var/log/wrapper.log'
    logerror: '/var/log/wrapper-error.log'
{#
  salt-zeus-pull:
    command: 'cd /mnt/volume_nyc3_01/saltmaster/ && git pull && git checkout master && git pull origin master'
    path: '/opt/scripts'
    user: 'root'
    group: 'root'
    wrappername: "wrapper-salt-{{ grains['host'] }}"
    log: '/var/log/wrapper.log'
    logerror: '/var/log/wrapper-error.log'
 #}
  rsync-background:
    command: 'rsync -rltoDvz /home/THRACE/erin/backgrounds/ /mnt/misc/erins_stuff/backgrounds/ > /var/log/wrapper.log'
    path: '/home/erin/bin'
    user: 'erin'
    group: 'erin'
    wrappername: "wrapper-rsyncbackground-{{ grains['host'] }}"
    log: '/var/log/wrapper.log' 
    logerror: '/var/log/wrapper-error.log'
  wallpaper:
    path: '/home/erin/bin'
    command: '/home/THRACE/erin/bin/wallpaper.sh'
    user: 'erin'
    group: 'erin'
    wrappername: "wrapper-wallpaper-{{ grains['host'] }}"
    log: '/var/log/wrapper.log' 
    logerror: '/var/log/wrapper-error.log'
  updatedb:
    path: '/opt/scripts'
    command: '/usr/bin/updatedb'
    user: 'root'
    group: 'root'
    wrappername: "wrapper-updatedb-{{ grains['host'] }}"
    log: '/var/log/wrapper.log' 
    logerror: '/var/log/wrapper-error.log'

