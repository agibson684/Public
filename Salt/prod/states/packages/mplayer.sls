#{% if grains['os'] == 'centos' or grains['os'] == 'debian' or grains['os'] == 'fedora'%}
#{% endif %}
{% if grains['os'] == 'debian' %}
debian_packages:
  pkg.installed:
    - pkgs:
      - mencoder
      - mplayer
      - libdvdcss2
{% endif %}
#{% if grains['os'] == 'fedora' %}
#{% endif %}
