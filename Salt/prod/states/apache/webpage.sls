webpage-dir:
  file.recurse:
    - user: www-data
    - group: www-data
    - file_mode: '0644'
    - dir_mode: '0755'
    - makedirs: True
    - force: True
    - recurse:
      - user
      - group
      - mode
    - name: /var/www/
    - source: salt://apache/files/www/
    - require:
      - service: apache2
webpage-dir-numbers:
  file.directory:
    - user: www-data
    - group: www-data
    - file_mode: '0644'
    - dir_mode: '0755'
    - makedirs: True
    - force: True
    - recurse:
      - user
      - group
      - mode
    - names:
      - /var/www/1
      - /var/www/3
      - /var/www/4
    - require:
      - service: apache2
/var/www/recipes/:
  file.directory:
    - user: www-data
    - group: www-data
    - file_mode: '0644'
    - dir_mode: '0755'
    - makedirs: True
    - recurse:
      - user
      - group
      - mode
    - require:
      - service: apache2

recipes-git:
  git.latest:
    - name: http://zeus.thrace-lan.info:3000/Thrace-lan.info/Recipes.git
    - target: /var/www/recipes/
    - user: www-data
    - branch: master
    - identity: /root/.ssh/git-www
/var/www/manual/:
  file.directory:
    - user: www-data
    - group: www-data
    - file_mode: '0644'
    - dir_mode: '0755'
    - makedirs: True
    - recurse:
      - user
      - group
      - mode
    - require:
      - service: apache2

manual-git:
  git.latest:
    - name: git@zeus.thrace-lan.info:Thrace-lan.info/manual.git
    - target: /var/www/manual
    - branch: master
    - identity: /root/.ssh/server-services

