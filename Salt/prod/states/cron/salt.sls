salt-cron:
  cron.present:
    - name: "/opt/scripts/wrapper.salt-pull.sh >/dev/null 2>&1"
    - user: root
    - minute: 15
    - hour: '*/1'
