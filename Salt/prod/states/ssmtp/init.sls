{%- if salt["grains.get"]("osrelease_info[1]", "") == "9" and salt["grains.get"]("os", "") == "Debian" %}
ssmtp:
  pkg:
    - installed

/etc/ssmtp/ssmtp.conf:
  file.managed:
    - users: root
    - group: root
    - mode: "0644"
    - template: jinja
    - require:
      - pkg: ssmtp
    - source: salt://ssmtp/files/ssmtp.conf

/etc/ssmtp/revaliases:
  file.managed:
    - users: root
    - group: root
    - mode: "0644"
    - source: salt://ssmtp/files/revaliases
{%- elif salt["grains.get"]("osrelease_info[1]", "") == "10" and salt["grains.get"]("os", "") == "Debian" %}
msmtp:
  pkg:
    - installed
msmtp-mta:
  pkg:
    - installed
/etc/msmtprc:
  file.managed:
    - users: root
    - group: root
    - mode: "0644"
    - template: jinja
    - require:
      - pkg: msmtp
    - source: salt://ssmtp/files/msmtprc
{%- else %}
msmtp:
  pkg:
    - installed
msmtp-mta:
  pkg:
    - installed
/etc/msmtprc:
  file.managed:
    - users: root
    - group: root
    - mode: "0644"
    - template: jinja
    - require:
      - pkg: msmtp
    - source: salt://ssmtp/files/msmtprc
{%- endif %}

