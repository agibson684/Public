updatedb:
  cron.present:
    - name: "/opt/scripts/wrapper.updatedb.sh > /dev/null 2>&1"
    - user: root
    - minute: 0
    - hour: '1'
