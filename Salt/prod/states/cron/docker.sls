{% if grains['host'] == 'docker' %}
{% set torrent_syncbox_enable = "present" %}
{% set torrent_syncnas_enable = "present" %}
flexget-cron:
  cron.{{ torrent_syncbox_enable }}:
    - name:  /root/.virtualenvs/flexget/venv/bin/flexget-headless  -c /opt/scripts/flexget/config.yml  execute >/dev/null 2>&1
    - user: root
    - minute: 0
    - hour: '*/1'
bittorrent-chmod-cron:
  cron.{{ torrent_syncbox_enable }}:
    - name:  /opt/scripts/chmod-bittorrent.sh >/dev/null 2>&1
    - user: root
    - minute: '*/5'
{% else %}
{% endif %}
