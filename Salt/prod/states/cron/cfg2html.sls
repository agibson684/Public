cfg2html:
  cron.present:
    - name: /opt/scripts/cfg2html.sh >/dev/null 2>&1
    - user: root
    - minute: 0
    - hour: 1
