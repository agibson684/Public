/var/log/hosts:
  file.directory:
    - user: logstash
    - group: root
    - mode: 750
    - makedirs: True
    - require:
      - pkg: logstash

/var/log/hosts/grok_failures:
  file.directory:
    - user: logstash
    - group: root
    - mode: 750
    - makedirs: True
    - require:
      - file: /var/log/hosts

logstash:
  pkg:
    - installed
  service:
    - running
    - enable: True
    - watch:
      - file: /etc/logstash/patterns.d
      {% for file in pillar["logstash"]["configs"] %}
      - file: {{ file }}
      {% endfor %}

# Java Memory/Heap Settings
/etc/logstash/jvm.options:
  file.managed:
    - source: {{ pillar["logstash"]["javaconfig"] }}
    - user: root
    - group: root
    - mode: 644
    - require:
      - pkg: logstash

# Logstash conf file
/etc/logstash/logstash.yml:
  file.managed:
    - source: {{ pillar["logstash"]["sysconfig"] }}
    - user: root
    - group: root
    - mode: 644
    - require:
      - pkg: logstash

# Custom Grok Patterns
/etc/logstash/patterns.d:
  file.recurse:
    - source: salt://logstash/patterns.d


# Main Configuration files
{% for file in pillar["logstash"]["configs"] %}
  {% set source = pillar["logstash"]["configs"][file]["source"] %}

{{ file }}:
  file.managed:
    - source: {{ source }}
    - user: logstash 
    - group: logstash
    - mode: 640
    - template: jinja
    - require:
      - pkg: logstash

{% endfor %}
