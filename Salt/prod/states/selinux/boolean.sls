# SELinux

{% if pillar["selinux"]["booleans"] is defined %}
{% for boolean in pillar["selinux"]["booleans"] %}
  {% set value = pillar["selinux"]["booleans"][boolean]["value"] %}
 
{{ boolean }}: 
  selinux.boolean:
    - value: {{ value }}
    - persist: True

{% endfor %}
{% endif %}

