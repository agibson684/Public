ssh:
  port: 22
  separation: "yes"
  users: "erin jenkins_run"
  keyregen: '3600'
  serverkeybit: '768'
  syslogfac: 'AUTH'
  loglevelsshd: 'info'
  logingrace: '120'
  rootlogin: 'no'
  strictmode: 'yes'
  rsaauth:  'yes'
  pubkeyauth: 'yes'
  ignore: 'yes'
  rhosts:  'no'
  ignorerhosts: 'yes'
  hostbauth:  'no'
  emptypass:  'no'
  challengerespauth: 'no'
  passwordauth: 'no'
  x11forward: 'yes'
  displayoffset: '10'
  printmotd:  'yes'
  printlastlog: 'yes'
  tcpkeepalive: 'yes'
  banner:  "/etc/issue.net"
  subsystemsftp: "sftp /usr/lib/openssh/sftp-server"
  usepam: 'yes'
  tcpforward: 'no'
  gatewayport:  'no'
  gssapiauth:  'yes'
  gssapistrict:  'no'
