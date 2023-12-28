include:
  - scripts.logservers

rotate-logstash-data:
  cron.present:
    - name: /root/scripts/ziplog.sh 
    - user: root
    - minute: 0
    - hour: 0
clean-logstash-data:
  cron.present:
    - name: /root/scripts/cleanlog.sh
    - user: root
    - hour: '*/24'


restart-logstash-newyear:
  cron.present:
    - identifier: Yearly restart of Logstash for new year bug
    - name: /sbin/service logstash restart
    - user: root
    - minute: 1
    - hour: 0
    - daymonth: 1
    - month: 1

