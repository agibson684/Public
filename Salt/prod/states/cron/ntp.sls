ntp:
  cron.present:
    - name: "/opt/scripts/wrapper.ntp.sh > /dev/null 2>&1"
    - user: root
    - minute: 0
    - hour: 1
