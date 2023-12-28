#!/bin/bash
set -x
echo 'checking out puppet master repo and applying'
echo 'please make sure your other repos are merged to master before applying'
cd /etc/puppet && git checkout support/experimental && git pull origin support/experimental && puppet apply manifests/site.pp
cd /etc/puppet && git checkout support/experimental && git pull origin-remote support/experimental && puppet apply manifests/site.pp
orig_summary=/var/lib/puppet/state/last_run_summary.yaml
new_summary=/root/last_run_summary.yaml
cp -fv $orig_summary $new_summary
