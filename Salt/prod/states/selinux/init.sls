#Debian install 
{% if grains['os'] == 'Debian' %}
selinux_deb_packages:
  pkg.installed:
    - pkgs:
      - selinux-basics 
      - selinux-policy-default
      - auditd
{% elif grains['os'] == 'Centos'  %}
selinux_centos_packages:
  pkg.installed:
    - pkgs:
      - selinux-basics
      - selinux-policy-targeted
      - auditd
{% else %}
# SELinux Troubleshoot server
{% endif %}

setroubleshoot-server:
  pkg:
    - installed


setroubleshoot-plugins:
  pkg:
    - installed


setroubleshoot-config:
  file.managed:
    - name: /etc/setroubleshoot/setroubleshoot.conf
    - source: {{ pillar["setroubleshoot"]["conf"] }}
    - template: jinja


setroubleshoot-email-config:
  file.managed:
    - name: /var/lib/setroubleshoot/email_alert_recipients
    - source: {{ pillar["setroubleshoot"]["email-conf"] }}
    - template: jinja
