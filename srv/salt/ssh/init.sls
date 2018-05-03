ssh:
  pkg.installed


{% for port in ['1234'] %}

/etc/ssh/sshd_config:
  file.managed:
    - source: salt://ssh/sshd_config
    - template: jinja
    - context:
      port: {{ port }}

{% end for %}


sshd:
  service.running:
    - watch:
      - file: /etc/ssh/sshd_config
