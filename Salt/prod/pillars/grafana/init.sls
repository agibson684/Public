    grafana:
      server:
        enabled: true
        admin:
          user: admin
          password: passwd
        database:
          engine: sqlite3
        dashboards:
          enabled: true
          path: /var/lib/grafana/dashboards

