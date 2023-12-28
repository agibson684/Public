apcupsd:
  ensure: present
  file: file
  upscable: usb
  upstype: usb
  device: ''
  lockfile: /var/lock
  scriptdir: /etc/apcupsd
  pwrfaildir: /etc/apcupsd
  nologindir: '/etc'
  onbatterydelay: '15'
  batterylevel: '5' 
  minutes: '3'
  ttimeout: '10'
  annoy: '300'
  annoydelay: '60'
  nologon: disable
  killdelay: '0'
  netserver: 'on'
  nisip: "0.0.0.0"
  eventsfile: /var/log/apcupsd.events
  eventsfilemax: '10'
  upsclass: standalone
  upsmode: disable
  stattime: '0'
  statfile: /var/log/apcupsd.status
  logstats: 'off'
  datatime: '0'
  email: agibson684@gmail.com