{% for wrapperscript, config in salt['pillar.get']('wrapperscripts', {}).items() %}
wrapper-{{ wrapperscript }}:
  file.managed:
    - name:  {{ config.path }}/wrapper.{{ wrapperscript }}.sh
    - user: {{ config.user }}
    - group: {{ config.group }}
    - mode: "0740"
    - template: jinja
    - source: salt://scripts/files/wrapper.sh
    - context:
      config: {{ config|tojson }}
{% endfor %}
/var/log/wrapper.log:
  file.managed:
    - user: root
    - group: admins
    - mode: "0760"
/var/log/wrapper-error.log:
  file.managed:
    - user: root
    - group: admins
    - mode: "0760"
/var/run/wrapper/:
  file.directory:
    - user: root
    - group: users
    - mode: "0777"
