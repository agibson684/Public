{#salt:
  git.latest:
    - name: ssh://erin.sims@githost.ism.ld:/var/git/projects/salt.git
    - target: /home/erin/salt-2014
    - user: erin
    - branch: master
    - identity: /home/erin/.ssh/erin.sims@bookit.git

Salt:
  git.latest:
    - name: ssh://git@git.thrace.lan/Salt.git
    - target: /home/erin/Salt
    - user: erin
    - branch: master


vagrant:
  git.latest:
    - name: ssh://erin.sims@git.ism.ld/var/git/salt-vagrant.git
    - target: /home/erin/salt-vagrant
    - user: erin
    - branch: master
    - identity: /home/erin/.ssh/erin.sims@bookit.git
salt-new:
  git.latest:
    - name: ssh://erin.sims@githost.ism.ld:/var/git/projects/control/salt.git
    - target: /home/erin/salt-2018
    - branch: master
    - identity: /home/erin/.ssh/erin.sims@bookit.git
#}
{#
dmenu:
  git.latest:
    - name: git://git.suckless.org/dmenu
    - target: /home/erin/source/dmenu
    - branch: master
dwm:
  git.latest:   
    - name: git://git.suckless.org/dwm
    - target: /home/erin/source/dwm
    - branch: master 
surf:
  git.latest:   
    - name: git://git.suckless.org/surf
    - target: /home/erin/source/surf
    - branch: master 
tabbed:
  git.latest:
    - name: git://git.suckless.org/tabbed
    - target: /home/erin/source/tabbed
    - branch: master 
queercat:
  git.latest:
    - name: https://github.com/Elsa002/queercat.git
    - target: /home/erin/source/queercat
    - branch: main
#}
