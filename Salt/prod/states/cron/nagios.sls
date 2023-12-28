nagios-insert:
  cron.present:
    - name: "perl /usr/local/nagiosgraph/bin/insert.pl >/dev/null 2>&1"
    - user: root
    - minute: '*/10'
