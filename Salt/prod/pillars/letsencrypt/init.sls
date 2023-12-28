# -*- coding: utf-8 -*-
# vim: ft=yaml
---
letsencrypt:
  #certbot certonly --webroot-path /etc/letsencrypt/live/www.thrace-lan.info-0004/  -d www.thrace-lan.info  -d nextcloud.thrace-lan.info   --dry-run  
  # Install using packages instead of git
  use_package: true
  # A list of package/s to install. To find the correct name for the variant
  # you want to use, check https://certbot.eff.org/all-instructions
  # Usually, you'll need a single one, but you can also add other plugins here.
  pkgs:
    - python-certbot-apache
  # Only used for the git install method (use_package: false)
  cli_install_dir: /opt/letsencrypt
  # Only used for the git install method (use_package: false). If you want to
  # have specific version of certbot you can enable it. The version value
  # should match a certbot/certbot branch.
  version: 0.30.x
  # Any parameter from the cli can be specified in the config file
  # check https://certbot.eff.org/docs/using.html#configuration-file
  config:
    server: https://acme-v02.api.letsencrypt.org/directory
    email: agibson684@gmail.com
    authenticator: standalone
    webroot-path: /var/www
    agree-tos: true
    keep-until-expiring: true
    expand: true
  # For backward compatibility, config can be passed as a string
  # (although it's discouraged, as this format might be dropped in a future
  # release)
  # config: |
  #   server = https://acme-v01.api.letsencrypt.org/directory
  #   email = webmaster@example.com
  #   authenticator = webroot
  #   webroot-path = /var/lib/www
  #   agree-tos = True
  #   keep-until-expiring = True
  #   expand = True
  config_dir:
    path: /etc/letsencrypt
    user: root
    group: root
    mode: 755
  domainsets:
    www.thrace-lan.info:
      - www.thrace-lan.info
      - nextcloud.thrace-lan.info
  # The post_renew cmds are executed via renew_letsencrypt_cert.sh after every
  # run. For more fine grain control, consider placing scripts in the pre,
  # post, and/or deploy directories within /etc/letsencrypt/renewal-hooks/. For
  # more information, see: https://certbot.eff.org/docs/using.html#renewal
  post_renew:
    cmds:
      - service apache2 reload
  cron:
    minute: 10
    hour: 2
    dayweek: 1
