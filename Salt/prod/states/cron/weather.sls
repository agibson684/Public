weather-daily:
  cron.present:
    - name: "/usr/bin/python3 /opt/scripts/weather.py dailyrun >/dev/null 2>&1"
    - user: root
    - minute: 0
    - hour: 12
    - daymonth: '*/1'
weather-compare:
  cron.present:
    - name: "/usr/bin/python3 /opt/scripts/weather.py compare >/dev/null 2>&1"
    - user: root
    - minute: '*/5'
