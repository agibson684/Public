prometheus:
  alertmanager: salt://alertmanager/files/alertmanager
  rules: salt://alertmanager/files/rules_athena.yml 
  alertmanager_yml: salt://alertmanager/files/alertmanager/alertmanager.yml
  alertmanager_binary: salt://alertmanager/files/alertmanager/alertmanager

