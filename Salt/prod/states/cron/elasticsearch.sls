elasticsearch curator:
  cron.absent:
    - identifier: elasticsearch curator
    - name:  "/root/scripts/curator-elasticsearch-cleanup.sh > /dev/null 2>&1"
   # - name: curator close indices --older-than 60 --time-unit days --timestring='\%Y.\%m.\%d' && curator delete indices --older-than 60 --time-unit days --timestring='\%Y.\%m.\%d'> /dev/null
    - user: root
    - daymonth: 1
    - require:
      - pkg: elasticsearch
