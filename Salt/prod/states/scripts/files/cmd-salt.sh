#!/bin/bash 

echo 'type in the hosts'
read hosts
echo 'type in the commands to run'
read commands
auth_salt=$(curl -sSk https://solan.thrace.lan:8001/login -H 'Accept: application/x-yaml' -d username='saltrun' --data-urlencode password='4yu!NC775&mJ' -d eauth=pam | awk '/token/{print $2}')

function check_salt_cmd {
	
curl -skS https://solan.thrace.lan:8001/run -H 'Accept: application/json' -d client='local_batch' -d tgt="$hosts" -d fun="cmd.run" -d arg="$commands" -d batch='2' -d username='saltrun' --data-urlencode password='4yu!NC775&mJ' -d 'eauth=pam'
}
check_salt_cmd 

