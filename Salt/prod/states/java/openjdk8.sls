# Includes OpenJDK 8
{% if grains['os'] == 'CentOS' %}
java-1.8.0-openjdk:
  pkg:
    - installed
{% elif grains['os'] == 'Debian' %}
adoptopenjdk-8-hotspot:
  pkg:
    - installed
{% endif %}
