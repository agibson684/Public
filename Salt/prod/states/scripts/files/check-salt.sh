#!/bin/bash 
#salt_url="https://solan.thrace.lan:8001"
#username="saltrun"
#userpassword=4yu!NC775&mJ'
set -x 
hosts="$1"
function check_salt_multi {
auth_salt=$(curl -sSk https://solan.thrace.lan:8001/login -H 'Accept: application/x-yaml' -d username='saltrun' --data-urlencode password='4yu!NC775&mJ' -d eauth=pam | awk '/token/{print $2}')
 
curl -k -sS https://solan.thrace.lan:8001  -H 'Content-type: application/json' -H  "X-Auth-Token: $auth_salt"  -d '
[
    {
    "client": "local_batch",
    "tgt": "solan.thrace.lan",
    "fun": "state.sls",
    "arg": ["salt.salt-git-latest"],
    "timeout": 60
    },
    {
     "client": "local_batch",
     "tgt": "'$hosts'",
     "fun": "saltutil.refresh_pillar",
     "timeout": 60
    },

    {
    "client": "local_batch",
    "tgt": "'$hosts'",
    "fun": "state.highstate",
    "timeout": 60
    }
]
' | jq '.' 

}

function check_salt_all {

auth_salt=$(curl -sSk https://solan.thrace.lan:8001/login -H 'Accept: application/x-yaml' -d username='saltrun' --data-urlencode password='4yu!NC775&mJ' -d eauth=pam | awk '/token/{print $2}')
curl -k -sS https://solan.thrace.lan:8001  -H 'Content-type: application/json' -H  "X-Auth-Token: $auth_salt"  -d '
[   
   {
   "client": "local_batch",
   "tgt": "solan.thrace.lan",
   "fun": "state.sls",
   "arg": ["salt.salt-git-latest"],
   "timeout": 60
   },

   {
   "client": "local_batch",
   "tgt": "*",
   "fun": "saltutil.refresh_pillar",
   "timeout": 60
   },
   
    {
    "client": "local_batch",
    "tgt": "*",
    "fun": "state.highstate",
    "timeout": 60
   }
]
' | jq '.'
}

generate_post_data()
{
	  cat <<EOF
    
     {
     "client": "local_batch",
     "tgt": "solan.thrace.lan",
     "fun": "state.sls",
     "arg": ["salt.salt-git-latest"],
     "timeout": 60
     },
     {
     "client": "local_batch",
     "tgt": "$hosts",
     "fun": "cmd.run",
     "arg": "$3",
     "timeout": 60
     }
EOF
}


function check_salt_cmd {

	auth_salt=$(curl -sSk https://solan.thrace.lan:8001/login -H 'Accept: application/x-yaml' -d username='saltrun' --data-urlencode password='4yu!NC775&mJ' -d eauth=pam | awk '/token/{print $2}')
	curl -k -sS https://solan.thrace.lan:8001  -H 'Content-type: application/json' -H "X-Auth-Token: $auth_salt" -d '
[
       	{
   "client": "local_batch",
   "tgt": "solan.thrace.lan",
   "fun": "state.sls",
   "arg": ["salt.salt-git-latest"],
   "timeout": 60
   },
   {
   "client": "local_batch",
   "tgt": "$hosts",
   "fun": "cmd.run",
   "arg": "$3",
   "timeout": 60
   }
]
	
	
	
	
	' | jq '.'
}

if [[ "$1" = '' ]]; then
check_salt_all
exit
fi
if [[ "$2" = '-c' ]]; then
check_salt_cmd
exit
fi
if [[ "$1" != '' ]]; then
check_salt_multi
fi
 

