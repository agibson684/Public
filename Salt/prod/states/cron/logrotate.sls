cron_logrotate:
  cron.present:
    - name: /opt/scripts/wrapper.logrotate.sh > /dev/null 2>&1
    - user: root
    - minute: 0
    - hour: 1
    - dayweek: 6 
