# Logrotate rules for haproxy/keepalived servers

logrotate:
  configs:
    /etc/logrotate.d/salt:
      source: salt://logrotate/confs/salt
