#!/bin/python3
import requests, sys, time, os, argparse, json
def main():
username = "saltrun"
userpassword = 4yu!NC775&mJ'
token = '11bee5e5fe72e9ef002f9d4ec54c1a71b7564343'
parser = argparse.ArgumentParser(description='Process some variables.')
parser.add_argument( 'env', choices=['do', 'home'])
parser.add_argument('key')
parser.add_argument('template')    
parser.add_argument('--arg', nargs=2, action='append')
args = parser.parse_args()    
with open("/tmp/output_ansible.txt", 'a+') as logfile:
logfile.write("\nRunning {} in \n--------------------------------\n".format(args.template))
filepath = "/tmp/"
filename = "%s_jobid.txt" % args.template
fullpath =  filepath + filename
with open(fullpath, '+w') as cancel_id:    
  if args.env == "do":
    url = "https://zeus.thrace-lan.info:8001/"
  elif args.env == "home":
    url = "https://solan.thrace.lan:8001/"
  else:
    sys.exit(1)
  if args.key :
    headers = {
    "Authorization": "Bearer {}".format(args.key ),
    "Content-Type": "application/json"
    }
  else: 
    print("parameters are not correct!")
    sys.exit(1)
  # if we got parameters try to put them in some json.  
  if args.arg:          
    print(json.dumps({ "extra_vars":{
    k: v.split(',') if ',' in v else v for k,v in args.arg
    } }, indent=4)
    )
    data = { 
    "extra_vars":{
     k: v.split(',') if ',' in v else v for k,v in args.arg
       }
     }
          


























#function check_salt_multi {
auth_salt=$(curl -sSk https://solan.thrace.lan:8001/login -H 'Accept: application/x-yaml' -d username='saltrun' --data-urlencode password='4yu!NC775&mJ' -d eauth=pam -d  token_expire=94670856 0| awk '/token/{print $2}')
 
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
 

