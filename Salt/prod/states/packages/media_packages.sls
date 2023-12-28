#{% if grains['os'] == 'centos' or grains['os'] == 'debian' or grains['os'] == 'fedora'%}
#{% endif %}
{% if grains['os'] == 'Debian' %}
debian_packages:
  pkg.installed:
    - pkgs:
      - mp3check
      - mp3blaster
      - mp3diags
{% endif %}
#{% if grains['os'] == 'Fedora' %}
#{% endif %}
