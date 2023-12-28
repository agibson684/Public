{% if grains['host'] == 'terreis' %}
backup-backgrounds:
  cron.present:
    - name: "/home/THRACE/erin/bin/wrapper.rsync-background.sh"
    - user: erin
    - minute: 0
    - hour: '*/6'
wallpaper:
  cron.present:
    - name: " /home/THRACE/erin/bin/wrapper.wallpaper.sh"
    - user: erin
    - minute: '0'
    - hour: '*/11'

blutooth:
  cron.absent:
    - name: "/home/THRACE/erin/.config/systemd/user/bluetooth_connect.sh >> /var/log/bluetooth.log 2>&1"
    - user: erin
    - minute: '*/1'
{% else %}
{% endif %}
