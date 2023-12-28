#!/bin/bash 

number=0
loop=4
time=4m
while [ "$number" != "$loop" ]
do 
#echo  'To:  agibson684@gmail.com' > /tmp/wakeup.tmp
#echo 'From: agibson684@gmail.com'  >> /tmp/wakeup.tmp
#echo 'Subject:  WAKE UP!'  >> /tmp/wakeup.tmp
#echo >> /tmp/wakeup.tmp
#echo >> /tmp/wakeup.tmp
#echo >> /tmp/wakeup.tmp
#echo 'It is time to wake up now!' >> /tmp/wakeup.tmp
#/usr/bin/msmtp -v agibson684@gmail.com < /tmp/wakeup.tmp

echo  'To:  3213563064@tmomail.net' > /tmp/wakeup.tmp
echo 'From: agibson684@gmail.com'  >> /tmp/wakeup.tmp
echo 'Subject:  WAKE UP!'  >> /tmp/wakeup.tmp
echo >> /tmp/wakeup.tmp
echo >> /tmp/wakeup.tmp
echo >> /tmp/wakeup.tmp
echo 'It is time to wake up now!' >> /tmp/wakeup.tmp
/usr/bin/msmtp -vvv 3213563064@tmomail.net < /tmp/wakeup.tmp
rm  /tmp/wakeup.tmp
(( number += 1 ))
sleep "$time"
done 
