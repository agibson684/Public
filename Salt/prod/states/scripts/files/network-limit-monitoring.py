#!/usr/bin/python3.5
import json
import subprocess
import pendulum
working_dir  = '/opt/scripts/net-monitoring/'
#this sets the dates
dt = pendulum.now()
today = dt.format('MMM \'YY')
#current month as starts on 0 so far 0 is all we need here
mymonth = 0
#this sets the limit number of gigs we can set about 500 GB
limit = 520000000
#run the command vnstat on the router and output the data in json and put it in a variable 
stdoutdata = subprocess.getoutput (["ssh -i /home/nagios/.ssh/gateway-01-15-2019 -p 1122 nrpe@192.168.1.1 vnstat -i igb0 --oneline "])
#format the data into json
myjson = json.loads(stdoutdata)
# do some print outs for diagnostics
#print(myjson['interfaces'][0]['traffic']['months'][mymonth])
#print(myjson['interfaces'][0]['traffic']['months'][mymonth]['tx'])
#print(myjson['interfaces'][0]['traffic']['months'][mymonth]['rx'])
#pull out the receiving metrics and put it in incoming
incoming = myjson['interfaces'][0]['traffic']['months'][mymonth]['rx']
#pull out the sending metrics and put it in outgoing
outgoing = myjson['interfaces'][0]['traffic']['months'][mymonth]['tx']
#add them together
total = incoming + outgoing
#check the total against the limit.
if total > limit:
 print("Warning limit breached!")
 print(total)
 print("WARNING")
 exit(2)
elif total < limit:
  print (total, "KB")
  print ("OK")
  exit(0)
#some code to change into python from a shell script 
#vnstat -m | grep "`date +"%b '%y"`" | awk '{print $3}' > file.txt
#next need to pick out the current month and total so far. check against limit and then decide if to send email. 
# eth0  /  monthly

