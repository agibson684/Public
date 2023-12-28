cron_btrfs_scrub:
  cron.present:
    - name: /usr/bin/btrfs scrub start > /dev/null 2>&1
    - user: root
    - minute: 0
    - hour: 0
    - dayweek: '*/6' 
