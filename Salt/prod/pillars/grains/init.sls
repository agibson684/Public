# Control /etc/salt/grains contents

grains:
  datacenter:
    testing: 
      - G@id:*sandbox*
  environment:
    testing:
      - G@environment:testing
  role:
    elasticsearch7:
      - G@id:sandbox1*
    logserver7:
      - G@id:sandbox2*
    laptop:
      - G@id:work*
      - G@id:cyane*

