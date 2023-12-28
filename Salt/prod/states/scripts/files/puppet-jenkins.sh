#!/bin/bash 
puppet apply /var/lib/jenkins/workspace/git/manifests/site.pp --modulepath=/var/lib/jenkins/workspace/git/modules

