{% if grains['os'] == 'CentOS' and grains['osrelease'].startswith('6.') %}
repo-base:
  file.managed:
    - name: /etc/yum.repos.d/CentOS-Base.repo
    - user: root
    - group: root
    - mode: '0644'
    - source: salt://repos/files/CentOS-Base.repo
    - require:
      - file: /etc/yum.repos.d/CentOS-Debuginfo.repo
      - file: /etc/yum.repos.d/CentOS-Media.repo
      - file: /etc/yum.repos.d/CentOS-Vault.repo

/etc/yum.repos.d/CentOS-Debuginfo.repo:
  file.managed:
    - user: root
    - group: root
    - mode: '0644'
    - source: salt://repos/files/CentOS-Debuginfo.repo

/etc/yum.repos.d/CentOS-Media.repo:
  file.managed:
    - user: root
    - group: root
    - mode: '0644'
    - source: salt://repos/files/CentOS-Media.repo

/etc/yum.repos.d/CentOS-Vault.repo:
  file.managed:
    - user: root
    - group: root
    - mode: '0644'
    - source: salt://repos/files/CentOS-Vault.repo

include:
  - .epel
{% endif %}

