include:
  - python

##########################
#   Pip Modules
##########################

# Create Pip Dependencies in a file
curator-requirements:
  file.managed:
    - name: /root/curator-requirements.txt
    - source: salt://elasticsearch/curator/curator-requirements.txt
    - user: root
    - mode: 600


# Install Pip Dependencies
curator:
  pip.installed:
    - requirements: '/root/curator-requirements.txt'
    - require:
      - pkg: python-pip
      - file: curator-requirements


actions-config:
  file.managed:
    - name: /etc/curator/actions.yml
    - source: salt://elasticsearch/curator/actions.yml
    - user: root
    - group: root
    - mode: 644

curator-config:
  file.managed:
    - name: /etc/curator/config.yml
    - source: salt://elasticsearch/curator/config.yml
    - user: root
    - group: root
    - mode: 644

/var/log/curator:
  file.directory:
   - user: root
   - group: root
   - dir_mode: 700
   - file_mode: 600

/etc/curator:
  file.directory:
   - user: root
   - group: root
   - dir_mode: 700
   - file_mode: 600

