/etc/cron.weekly/system-verify:
  file.managed:
    - users: root
    - group: root
    - mode: "0655"
    - template: jinja
    - source: salt://system_verify/files/system_verify
