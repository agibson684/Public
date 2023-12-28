msmtp:
  defaults:
    auth: on
    tls: on
    tls_trust_file: /etc/ssl/ca-certificates.txt
    logfile:  /etc/msmtp.log
  accounts:
    gmail:
      from: erin.1983.fl@gmail.com
      host: smtp.gmail.com
      port: 587
      user: erin.1983.fl
      password: wtwrmsddktiauymb 
     
  aliases:
    default: 'esims684@protonmail.com'
    mailer-daemon: 'esims684@protonmail.com'
    postmaster: 'esims684@protonmail.com'
    nobody: 'esims684@protonmail.com'
    hostmaster: 'esims684@protonmail.com'
    usenet: 'esims684@protonmail.com'
    news: 'esims684@protonmail.com'
    webmaster: 'esims684@protonmail.com'
    www: 'esims684@protonmail.com'
    ftp: 'esims684@protonmail.com'
    abuse: 'esims684@protonmail.com'
    noc: 'esims684@protonmail.com'
    security: 'esims684@protonmail.com'
    root: 'esims684@protonmail.com'
    clamav: 'esims684@protonmail.com'
  default_account: gmail
