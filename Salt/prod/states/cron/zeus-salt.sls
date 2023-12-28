salt-zeus-pull:
  cron.present:
    - name: "/opt/scripts/wrapper.salt-zeus-pull.sh"
    - user: root
    - minute: 15
    - hour: '*/1'
