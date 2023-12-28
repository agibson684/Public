base:
  'G@id:*.thrace.lan':
      - match: compound 
      - secrets
      - backup
      - msmtp
  'datacenter:home':
      - match: grain
      - logrotate
      - rsyslog.systemd
      - consul-pillar
      - consul-pillar.configs
      - packages
      - backup 
      - systemd.mounts
      - ssh.all
      - msmtp
      - scripts
      - secrets
      - systemd.timers
      - systemd.apt
      - systemd.smartmon
      - backup.bbackup
  'G@id:cyane.thrace.lan':
      - match: compound
      - logrotate
      - packages
      - systemd.mounts
      - ssh.all
      - scripts
      - rsyslog.systemd
      - msmtp
  'G@roles:droplet':
      - match: compound
      - packages
      - consul-pillar.configs
      - msmtp
      - secrets
      - systemd.timers
      - systemd.apt
      - systemd.smartmon
      - logrotate
      - msmtp
      - scripts.droplet
  'datacenter:redfox':
      - match: grain
      - backup.redfox
      - packages.redfox
      - msmtp
      - systemd.timers
      - systemd.apt
      - systemd.smartmon
      - logrotate
      - msmtp
      - scripts.redfox
      - desktop
  'G@roles:workstation':
      - desktop
      - scripts 
      - samba-pillar  
  'G@roles:laptop':
      - msmtp
      - desktop
      - scripts.laptop
      - desktop.xorg
  'G@roles:server':
      - match: compound
      - prometheus-pillar.systemd.node_exporter
      - prometheus-pillar.node-exporters
      - scripts
  'G@roles:apcupsd':
      - match: compound
      - apcupsd
  'G@id:zeus':
      - match: compound
      - ssh.zeus
      - consul-pillar.zeus
      - prometheus-pillar.systemd.node_exporter_zeus
      - prometheus-pillar.node-exporters
      - prometheus-pillar.systemd.blackbox_exporter_zeus
      - prometheus-pillar.blackbox-exporters
      - prometheus-pillar.systemd-exporters
      - prometheus-pillar.systemd.systemd_exporter_zeus
      - prometheus-pillar.systemd.nextcloud_exporter_zeus
      - consul-pillar.zeus-init
      - prometheus-pillar.zeus
      - prometheus-pillar.alertmanager_droplet
      - prometheus-pillar.systemd.alertmanager_zeus
      - prometheus-pillar.apache-exporters
      - prometheus-pillar.systemd.apache_exporter_zeus
      - prometheus-pillar.nextcloud-exporters 
      - prometheus-pillar.systemd.nextcloud_exporter_zeus
      - prometheus-pillar.connect-exporters-droplet
      - prometheus-pillar.systemd.connection-status-exporter_zeus
      - prometheus-pillar.systemd.ssh_exporter
      - prometheus-pillar.ssh-exporters
  'G@id:athena': 
      - match: compound
      - consul-pillar.athena
      - prometheus-pillar.athena
      - prometheus-pillar.alertmanager_droplet
      - prometheus-pillar.systemd.alertmanager_athena
      - prometheus-pillar.systemd.node_exporter_athena
      - prometheus-pillar.node-exporters
      - prometheus-pillar.systemd.blackbox_exporter_athena
      - prometheus-pillar.blackbox-exporters
      - prometheus-pillar.systemd-exporters
      - prometheus-pillar.systemd.systemd_exporter_athena
      - consul-pillar.athena-init
      - prometheus-pillar.connect-exporters-droplet
      - prometheus-pillar.systemd.connection-status-exporter_athena
  'G@id:solan.thrace.lan':
      - match: compound
      - consul-pillar.solan
      - ums
      - ssh.solan
      - bind
      - iptables.solan
      - letsencrypt
      - prometheus-pillar
      - prometheus-pillar.alertmanager
      - prometheus-pillar.systemd.alertmanager_solan
      - prometheus-pillar.systemd-exporters
      - prometheus-pillar.cifs-exporters 
      - prometheus-pillar.domain-exporters
      - prometheus-pillar.systemd.nextcloud_exporter
      - prometheus-pillar.systemd.systemd_exporter 
      - prometheus-pillar.systemd.cifs_exporter
      - prometheus-pillar.systemd.connection-status-exporter
      - prometheus-pillar.connect-exporters
      - prometheus-pillar.nextcloud-exporters 
      - systemd.mounts
      - prometheus-pillar.systemd.node_exporter
      - prometheus-pillar.node-exporters
      - networking.solan
      - backup
  'G@id:aries.thrace.lan':  
      - match: compound
      - consul-pillar.aries
      - prometheus-pillar
      - prometheus-pillar.alertmanager
      - prometheus-pillar.systemd.node_exporter
      - prometheus-pillar.node-exporters
      - prometheus-pillar.systemd.blackbox_exporter
      - prometheus-pillar.blackbox-exporters
      - prometheus-pillar.systemd.alertmanager_aries
      - prometheus-pillar.connect-exporters
      - prometheus-pillar.systemd-exporters
      - prometheus-pillar.cifs-exporters 
      - prometheus-pillar.systemd.systemd_exporter 
      - prometheus-pillar.systemd.cifs_exporter
      - prometheus-pillar.systemd.connection-status-exporter
      - grafana
      - ssh.aries
      - bind
      - iptables.aries
      - systemd.mounts
      - networking.aries
  'G@id:calisto.thrace.lan':
      - match: compound
      - consul-pillar.calisto
      - ssh.calisto  
      - samba-pillar.calisto
      - dhcpd
      - iptables.calisto
      - prometheus-pillar.node-exporters
      - prometheus-pillar.blackbox-exporters
      - prometheus-pillar.bind-exporters 
      - prometheus-pillar.systemd-exporters
      - prometheus-pillar.cifs-exporters 
      - prometheus-pillar.digitalocean_exporter
      - prometheus-pillar.systemd.nextcloud_exporter
      - prometheus-pillar.systemd.systemd_exporter 
      - prometheus-pillar.systemd.cifs_exporter
      - prometheus-pillar.systemd.blackbox_exporter
      - prometheus-pillar.systemd.digitalocean_exporter
      - networking.calisto
      - mpd
  'G@id:gabrielle.thrace.lan':
      - match: compound
      - consul-pillar.gabrielle
      - ssh.gabrielle
      - ums
      - samba-pillar.gabrielle 
      - iptables.blade
      - prometheus-pillar.systemd-exporters
      - prometheus-pillar.systemd.systemd_exporter
      - networking.gabrielle
#not working right now #}
{#      - prometheus-pillar.mysqld-exporters #}
{#      - prometheus-pillar.systemd.mysqld_exporter #}
  'G@id:terreis.thrace.lan':
      - match: compound
      - ssh.terreis
      - iptables.workstation
      - selinux
      - consul-pillar.terreis
      - prometheus-pillar.systemd-exporters
      - prometheus-pillar.cifs-exporters 
      - prometheus-pillar.systemd.systemd_exporter 
      - prometheus-pillar.systemd.cifs_exporter
      - systemd.mounts
      - prometheus-pillar.systemd.node_exporter
      - prometheus-pillar.node-exporters
      - prometheus-pillar.blackbox-exporters
      - prometheus-pillar.systemd.blackbox_exporter
      - networking.terreis
  'G@id:ephiny.thrace.lan':
      - match: compound
      - ssh.ephiny
      - iptables.workstation
      - selinux
      - systemd.mounts
      - networking.ephiny
  'G@id:lyceus.thrace.lan':
      - match: compound
      - ssh.lyceus
  'G@id:joxer.thrace.lan':
      - match: compound
      - consul-pillar.joxer
      - consul-pillar.joxer-init
      - prometheus-pillar.systemd-exporters
      - prometheus-pillar.systemd.systemd_exporter
  'G@id:hades':
      - match: compound
      - ssh.hades 
      - consul-pillar.hades
      - consul-pillar.hades-init
      - prometheus-pillar.systemd.node_exporter_hades
      - prometheus-pillar.node-exporters
      - prometheus-pillar.systemd.blackbox_exporter_hades
      - prometheus-pillar.blackbox-exporters
      - prometheus-pillar.systemd-exporters
      - prometheus-pillar.systemd.systemd_exporter_hades
  'G@id:work*':
      - match: compound
      - systemd.mounts
  'G@id:xena.thrace.lan':
      - match: compound
      - consul-pillar.xena
      - consul-pillar.xena-init
      - prometheus-pillar.systemd.node_exporter
      - prometheus-pillar.node-exporters
      - prometheus-pillar.systemd.blackbox_exporter
      - prometheus-pillar.blackbox-exporters
      - prometheus-pillar.systemd-exporters
      - prometheus-pillar.systemd.systemd_exporter
      - dhcpd
      - prometheus-pillar.dhcpd-exporters  
      - prometheus-pillar.systemd.dhcpd_leases_exporter
      - prometheus-pillar.plex-exporters
      - prometheus-pillar.systemd.plex_exporter
      - networking.xena
      - samba-pillar.xena
  'G@id:mediacenter.thrace.lan':
      - match: compound
      - consul-pillar.mediacenter
      - consul-pillar.mediacenter-init
      - prometheus-pillar.systemd.node_exporter
      - prometheus-pillar.node-exporters
      - prometheus-pillar.systemd.blackbox_exporter
      - prometheus-pillar.blackbox-exporters
      - prometheus-pillar.systemd-exporters
      - prometheus-pillar.systemd.systemd_exporter
      - networking.mediacenter
      - desktop.mediacenter
  'G@id:kodi.thrace.lan':
      - match: compound
      - consul-pillar.mediacenter
      - consul-pillar.mediacenter-init
      - prometheus-pillar.systemd.node_exporter
      - prometheus-pillar.node-exporters
      - prometheus-pillar.systemd.blackbox_exporter
      - prometheus-pillar.blackbox-exporters
      - prometheus-pillar.systemd-exporters
      - prometheus-pillar.systemd.systemd_exporter
      - networking.kodi
      - desktop.kodi 
  'G@id:docker.thrace.lan':
      - match: compound
      - ssh.docker
      - samba-pillar.docker
 
 
