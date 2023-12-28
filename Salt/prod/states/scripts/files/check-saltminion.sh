#!/bin/bash
# 
# check OS version its either 6 or 7
grep "6\." /etc/redhat-release
if [ "$?" -eq "0" ]; then
	/sbin/service salt-minion status |grep "running"
	if [ "$?" -eq "1" ]; then
		/sbin/service salt-minion start
	fi
	else /usr/bin/systemctl status salt-minion |grep -i active |grep -i running
	if [ "$?" -eq "1" ]; then
		/usr/bin/systemctl start salt-minion
	fi
fi
