check salt-minion service:
  cron.absent:
    - identifier: "Check salt-minion service"
    - name: "/usr/bin/salt-call state.highstate "
    - minute: 30
    - hour: '*/3'
    - user: root


