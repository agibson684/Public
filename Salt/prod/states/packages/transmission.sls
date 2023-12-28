#include:
#  - scripts.flexget
transmission_packages:
  pip.installed:
    - names:
#      - transmission-daemon
      - python3-pip
      - transmission-cli
#transmission-daemon:
#  service.running:
#    - require:
#      - pkg: debian_packages
#      - pip: flexget
