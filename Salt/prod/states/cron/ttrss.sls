ttrss_update:
  cron.present:
    - name: "perl /usr/local/nagiosgraph/bin/insert.pl >/dev/null 2>&1"
    - user: www-data
    - minute: '*/30'
