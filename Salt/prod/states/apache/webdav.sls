#A WebDAV client using li-bcurl. It is used when music_directory contains a http:// or https:// URI, for example https://the.server/dav/.

Enable dav module:
  apache_module.enabled:
    - names: 
      - dav
      - dav_fs
      - dav_lock
      - ssl
www-data:
  user.present:
    - fullname: www-data
    - shell: /bin/sh

{% for webdav_name, config in salt['pillar.get']('webdav_locations', {}).items() %}

webdav-{{ webdav_name }}-file-config:
  file.managed:
    - name: /etc/apache2/sites-available/{{ webdav_name }}-dav-ssl.conf
    - users: root
    - group: root
    - mode: '0644'
    - template: jinja
    - source: salt://apache/files/webdav.conf
    - context:
      config: {{ config|tojson }}

enable {{ webdav_name }} site:
  apache_site.enabled:
    - name: {{ webdav_name }}-dav-ssl

webdav-{{ webdav_name }}-root:
  file.directory:
    - user: www-data
    - group: www-data
    - mode: '0744'
    - name: {{ config.doc_root }}
    - context:
      config: {{ config|tojson }}
{#
webdav-{{ config.doc_root }}{{ webdav_name }}:
  file.directory:
    - user: www-data
    - group: www-data
    - mode: '0744'
    - name: {{ config.doc_root }}{{webdav_name}}
#}
{{ config.doc_root }}{{ webdav_name }}:
  file.symlink:
   - target: /pool/{{ webdav_name }}

apache_service_{{ webdav_name }}:
  service.running:
    - name: apache2
    - watch:
      - file: webdav-{{ webdav_name }}-file-config
      - file: webdav-{{ webdav_name }}-root
      - file: {{config.doc_root }}{{ webdav_name }}

{% endfor %}

