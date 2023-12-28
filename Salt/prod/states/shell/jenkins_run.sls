/home/jenkins_run/.profile:
  file.managed:
    - users: jenkins_run
    - group: admins
    - mode: "0600"
    - source: salt://shell/files/.profile
/home/jenkins_run/.dir_colors:
  file.managed:
    - users: jenkins_run
    - group: admins
    - mode: "0600"
    - source: salt://shell/files/.dir_colors
/home/jenkins_run/.bashrc:
  file.managed:
    - users: jenkins_run
    - group: admins
    - mode: "0600"
    - source: salt://shell/files/bashrc
/home/jenkins_run/bin:
  file.directory:
    - users: jenkins_run
    - group: admins
    - mode: "0755"
/home/jenkins_run/.ssh:
  file.directory:
    - users: jenkins_run
    - group: admins
    - mode: "0700"
jenkins_run:
  user.present:
      - fullname: jenkins_run
      - shell: /bin/bash
      - home: /home/jenkins_run
      - groups:
        - admins 
