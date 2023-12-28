weechat.packages:
  pkg.installed:
    - pkgs:
      - screen
{% if grains['os'] == 'Debian' %}
      - weechat-curses
{% elif grains['os'] == 'Arch' %}
      - weechat
{% endif %} 
weechat-files:
  file.recurse:
    - user: erin
    - group: erin
    - file_mode: '0751'
    - dir_mode: '0740'
    - makedirs: True
    - name: /home/erin/.weechat
    - source: salt://screen/files/weechat/
    - require:
      - pkg: weechat.packages
weechat-screen-files:
  file.managed:
    - user: erin
    - group: users
    - mode: '0644'
    - names:
      - /home/erin/.screenrc:
        - source: salt://screen/files/.screenrc
      - /home/erin/.screenrc2:
        - source: salt://screen/files/.screenrc2
      - /home/erin/.screenrc3:
        - source: salt://screen/files/.screenrc3
      - /home/erin/.screenrc4:
        - source: salt://screen/files/.screenrc4
      - /home/erin/.screenrc5:
        - source: salt://screen/files/.screenrc5
      - /home/erin/.screenrc6:
        - source: salt://screen/files/.screenrc6
      - /home/erin/.screenrc7:
        - source: salt://screen/files/.screenrc7
    - require:
      - pkg: weechat.packages
