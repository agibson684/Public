{% if grains['os'] == 'Debian' %}
jenkins-repo:
  pkgrepo.absent:
{#    - humanname: jenkins
    - name: 'deb https://pkg.jenkins.io/debian binary/'
    - key_url: salt://repos/files/jenkins.io.key
    - file: /etc/apt/sources.list.d/jenkins.list #}
{% endif %}
