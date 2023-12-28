wrapperscripts:
  ntp:
    command: '/usr/sbin/ntpdate -v -p 5 -u pool.ntp.org'
    user: 'root'
    group: 'root'
    path: '/opt/scripts'
    wrappername: "wrapper-ntp-{{ grains['host'] }}"
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
  updatedb:
    path: '/opt/scripts'
    command: '/usr/bin/updatedb'
    user: 'root'
    group: 'root'
    wrappername: "wrapper-updatedb-{{ grains['host'] }}"
    log: '/var/log/wrapper.log' 
    logerror: '/var/log/wrapper-error.log'
