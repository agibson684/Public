{% if grains['os'] == 'Debian' %}
mono-repo:
  pkgrepo.managed:
    - humanname: Mono
    - name: 'deb https://download.mono-project.com/repo/debian  {{ grains['lsb_distrib_codename'] }} main'
    - gpgcheck: 1
    - keyserver: keyserver.ubuntu.com
    - keyid: '3FA7E0328081BFF6A14DA29AA6A19B38D3D831EF'
    - file:  /etc/apt/sources.list.d/mono-offical-stable.list
{% endif %}
