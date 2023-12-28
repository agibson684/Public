base:
  'datacenter:home':
    - match: grain
    - shell.groups
    - sudo
    #- rsyslog
    - cron
    - cron.backup
    - cron.cfg2html
    - cron.logrotate
    - cron.ntp
    - cron.terreis
    - cron.updatedb
    - fstab
    - logrotate
    - sysstat
    - cron.salt-minion
    - scripts
    - scripts.puppet 
    - hosts
    - packages 
    - packages.packages
    - repos 
    - system_verify
    - ssh.sshd
    - ssh.sshkey_jenkins
    - samba 
    #- scripts.wrapper
    - msmtp
    - systemd.units
    - scripts.prometheus
    #- packages.salt-packages
    - networking
    - backup
    - scripts.wrapper
  'roles:apache':
    - match: grain
  'roles:bind':
    - match: grain
  'roles:droplet':
    - match: grain
    - msmtp
    - shell 
    - scripts
    - packages
    - packages.droplets
    - system_verify
    - scripts.wrapper
    - scripts.remote
    - cron
#    - prometheus-exporters
#    - prometheus-exporters.config
    - systemd.units
#    - scripts.prometheus
   # - cron.backup
    - cron.cfg2html
    - cron.logrotate
    - cron.ntp
    - cron.updatedb
    - screen
  'datacenter:redfox':
    - match: grain
    - msmtp
    - shell
    - shell.kim
    - shell.groups
    - scripts
    - packages.redfox
    - shell.desktop_groups
    - desktop.redfox
    - system_verify
    - scripts.remote
    - cron
    - cron.backup
    - cron.cfg2html
    - cron.logrotate
    - cron.ntp
    - cron.updatedb
    - cron.btrfs
    - screen
    - repos
  'roles:elasticsearch':
    - match: grain
  'roles:icinga':
    - match: grain
  'roles:icinga_remote':
    - match: grain
  'roles:jenkins':
    - match: grain
  'roles:jenkins_slave':
    - match: grain
  'roles:laptop':
    - match: grain
    - scripts.laptop
    - packages.mplayer
    - desktop.laptop 
    - shell
    - ssh.sshkey_ephiny
    - git
    - screen
    - desktop.xorg
  'os:Debian and roles:laptop':
    - match: grain
    - networking.vpn
    - shell.kodi
    - desktop.media
  'roles:ldap_client':
    - match: grain
  'roles:ldap_server':
    - match: grain
  'roles:mediaserver':
    - match: grain
    - packages.mplayer 
    - packages.transmission
  #  - ums 
  'roles:mediashares':
    - match: grain
  'roles:musicserver':
    - match: grain
    - mpd
  'roles:mysql':
    - match: grain
  'roles:nagios':
    - match: grain
  'roles:nextcloud':
    - match: grain
  'os:Debian':
    - match: grain
    - aptlistchanges
    - cfg2html
  'virtual:physical or roles:laptop':
    - match: grain
    - backup.bbackup
  'roles:apcupsd':
    - match: grain
#    - repos.virtualbox
    - apcupsd
  'roles:rss':
    - match: grain
  'roles:remotedesktop':
    - match: grain
    - mosh
    - screen
  'roles:server':
    - match: grain
    - shell
    - scripts.server
  #  - prometheus-exporters
    - backup
  'roles:consul_server':   
    - match: grain
    - consul
  'roles:shaarli_droplet':
    - match: grain
  'roles:shaarli':
    - match: grain
  'roles:shares':
    - match: grain
  'roles:ssh':
    - match: grain
  'roles:tt_rss':
    - match: grain
  'roles:users':
    - match: grain
  'roles:videoserver':
    - match: grain
    - packages.media_packages
  'roles:webpage_droplet':
    - match: grain
    - apache.webpage
    - apache.zeus_config
  #  - prometheus
    - alertmanager
    - cron.weather 
  'roles:webpage':
    - match: grain
    - apache.webpage
    - apache.webpage_config
  'roles:workstation':
    - match: grain
    - screen
    - scripts.desktop
    - packages.mplayer
    - udiskie
    - desktop
    - desktop.sshfs
    - desktop.hacker
    - networking.vpn
    - cron.terreis
    - git
    - shell
    - mpd.cantata
    - iptables
    - shell.desktop_groups
  'roles:www_droplet':
    - match: grain
  'roles:www':
    - match: grain
  'id:solan.thrace.lan':
    - match: grain
    - sudo
    - mosh
    - screen
    - cron.backup
    - consul
    - ssh.sshkey_solan
    - cron.salt
#    - bind
    - iptables
   {# - letsencrypt this is broken not sure how to fix #}
  #  - prometheus
#    - alertmanager
#    - prometheus-exporters
#    - prometheus-exporters.config
    - shell.ssh_check
  'id:aries.thrace.lan':
    - match: grain
#    - prometheus
#    - alertmanager
    - consul
    - ssh.sshkey_aries
#    - bind
    - iptables
#    - prometheus-exporters
#    - prometheus-exporters.config
    - grafana
  'id:gabrielle.thrace.lan':
    - match: grain
    - cron.gabrielle
    - consul
#    - elasticsearch.elasticsearch7
#    - kibana
    - ssh.sshkey_gabrielle
#    - logstash.logstash7
    - iptables
   # - promethues-exporters.mysql-install
    - prometheus-exporters
    - scripts.server 
    - backup.bbackup
  'id:lyceus.thrace.lan':
    - match: grain
    - ssh.sshkey_lyceus
  'id:joxer.thrace.lan':
    - match: grain
    - ssh.sshkey_joxer
    - consul
    - prometheus-exporters
  'id:calisto.thrace.lan':
    - match: grain
    - cron.calisto
#    - elasticsearch.elasticsearch7
#    - kibana
    - ssh.sshkey_calisto
#    - dhcpd.secondary
    - iptables
    - consul
    - prometheus-exporters
    - prometheus-exporters.config
    - cron.push_clean
  'id:terreis.thrace.lan':
    - match: grain
    - consul
    - selinux.disabled
    - prometheus-exporters
    - prometheus-exporters.config
  'id:ephiny.thrace.lan':
    - match: grain
    - ssh.sshkey_ephiny
    - consul
    - selinux.disabled
  'id:xena.thrace.lan':
    - match: grain
    - ssh.sshkey_xena
    - consul
    - prometheus-exporters
    - prometheus-exporters.config
    - repos.fai
#    - dhcpd
    - packages.transmission
    - scripts.flexget 
  'id:athena':
    - match: grain
    - prometheus
    - alertmanager
  'id:zeus':
    - match: grain
    - prometheus
    - alertmanager
  'id:mediacenter.thrace.lan':
    - match: grain
    - prometheus-exporters
    - prometheus-exporters.config
    - shell.kodi
    - desktop.media
  'id:kodi.thrace.lan':
    - match: grain
    - prometheus-exporters
    - prometheus-exporters.config
    - shell.kodi
    - desktop.media
  'id:cyane.thrace.lan':
    - match: grain
    - scripts.laptop
    - packages.mplayer
    - desktop.laptop 
    - shell
    - ssh.sshkey_ephiny
    - git
    - screen
  'id:m0mD4Dm3d14574710n':
    - match:  grain
    - cron
  'id:docker.thrace.lan':
    - match: grain 
    - scripts.flexget 
    - scripts.server 
    - ssh.sshkey_docker
    - cron.docker
    
