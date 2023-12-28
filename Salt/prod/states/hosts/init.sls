#/etc/hosts:
#  file.managed:
#    - users: root
#    - group: root
#    - mode: "0655"
#    - template: jinja
#    - source: salt://hosts/files/hosts

/etc/hostname:
  file.managed:
    - users: root
    - group: root
    - mode: "0655"
    - template: 
    - contents: {{ grains['fqdn'] }}

calisto:
  host.present:
    - ip: 
      - 192.168.1.220
    - names: 
      - calisto.thrace.lan
      - calisto 

terreis:
  host.present:
    - ip:
      - 192.168.1.222
    - names:
      - terreis.thrace.lan
      - terreis
ephiny:
  host.present:
    - ip:
      - 192.168.1.225
    - names:
      - ephiny.thrace.lan
      - ephiny
dvr:
  host.present:
    - ip:
      - 192.168.1.226
    - names:
      - dvr.thrace.lan
      - dvr
cyane:
  host.present:
    - ip:
      - 192.168.1.26
      - 192.168.1.27
    - names:
      - cyane.thrace.lan
      - cyane
cyrene:
  host.present: 
    - ip:
      - 192.168.1.28
      - 192.168.1.29
    - names:
      - cyrene.thrace.lan
      - cyrene
xena:
  host.present:
    - ip:
      - 192.168.1.202
    - names:
      - xena.thrace.lan
      - xena

gateway:
  host.present:
    - ip:
      - 192.168.1.1
    - names:
      - gateway.thrace.lan
      - gateway
      - gw
      - cereberus

joxer:
  host.present:
    - ip:
      - 192.168.1.208
    - names:
      - joxer.thrace.lan
      - joxer

salmoneus:
  host.present:
    - ip:
      - 192.168.1.203
    - names:
      - salmoneus.thrace.lan
      - salmoneus

gabrielle:
  host.present:
    - ip:
      - 192.168.1.201
    - names:
      - gabrielle.thrace.lan
      - cifs.thrace.lan
      - transmission.thrace.lan
      - news.thrace.lan
      - gabrielle

lyceus:
  host.present:
    - ip:
      - 192.168.1.207
    - names:
      - lyceus.thrace.lan
      - lyceus
eve:
  host.present:
    - ip:
      - 192.168.1.206
    - names:
      - eve.thrace.lan
      - eve

solan:
  host.present:
    - ip:
      - 192.168.1.204
    - names:
      - solan.thrace.lan
      - solan 
      - shaarli.thrace.lan
      - www.thrace.lan
      - salt
      - saltmaster
      - master
      - git.thrace.lan
      - git 
      - alertmanager1
docker:
  host.present:
    - ip:
      - 192.168.1.205
    - names:
      - docker.thrace.lan
      - docker
      - plex 
      - transmission
      - agent


aries:
  host.present:
    - ip:
      - 192.168.1.221
    - names:
      - aries.thrace.lan
      - aries
      - alertmanager2

piradio:
  host.present:
    - ip:
      - 192.168.1.223
    - names:
      - piradio.thrace.lan
      - piradio

mediacenter:
  host.present:
    - ip:
      - 192.168.1.224
    - names:
      - pitv.thrace.lan
      - pitv
      - mediacenter
      - mediacenter.thrace.lan
switch:
  host.present:
    - ip:
      - 192.168.1.227
    - names:
      - switch.thrace.lan
      - switch
kodi:
  host.present:
    - ip:
      - 192.168.1.250
    - names:
      - kodi
      - kodi.thrace.lan
zeus:
  host.present:
    - ip:
      -  68.183.50.72
    - names:
      - zeus
      - zeus.thrace-lan.info
      - zeus.thrace-lan.site
      - alertmanager3
hades:
  host.present:
    - ip:
      - 104.131.0.100
    - names:
      - hades
      - hades.thrace-lan.info
      - hades.thrace-lan.site
athena:
  host.present:
    - ip:
      - 167.71.188.165
    - names: 
      - athena
      - athena.thrace-lan.info
      - athena.thrace-lan.site  

#192.168.1.30
#192.168.1.31
#192.168.1.32
#192.168.1.33

