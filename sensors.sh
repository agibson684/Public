#!/bin/bash
#set -x 
# "|TOTAL=${total}KB;;;; USED=${used}KB;;;; FREE=${free}KB;;;; CACHES=${caches}KB;;;;";
#perfdata example
###################helpful info and some help for users
usageHelp="Usage: ${0##*/}"
s13="use the -w and -c switches to determine the degrees for warning and critical of sensors 1-4"
badOptionHelp="Option not recognised"
printHelpAndExit()
{
        echo "$usageHelp"
        echo "$s13"
        exit 3
}
printErrorHelpAndExit()
{
        echo
        echo "$@"
        echo
        echo
        printHelpAndExit
}
###
##this evaluates the options with getops and  determines the warning and critcals, and  which sensors you want. I got4, so i wrote for 4. 
##
###
while getopts "w:c:hs:" optionName; do
	case "$optionName" in
	h) printHelpAndExit;;
	w) warning="$OPTARG";;
	s) sensornum="$OPTARG";;
	c) critical="$OPTARG";;
	[?]) printErrorHelpAndExit "$badOptionHelp";;
	esac
done
###
##this awks the sensors command to print out the temperature readings. Then it puts in the Sensors array!
###
Sensors=$(sensors| awk '/temp[1-3]:/ {sub(/°C$/,"",$2);sub(/\+/,"",$2);  print $2}')
array=(echo ${Sensors})
	if [[ ${sensornum} ==  "1" ]]; then
	#echo one
###
##this removes the floating point, since bash shell scripting can't handle decimals.
##then it  evaluates to the options you set for the critical and warning variables, to see what exit code to use and  output warning or critical, or ok.
###
	printf -v a1 %.0f ${array[1]}
		if [[ ${a1} -lt "$warning" ]]; then
		echo "OK $a1 Celcius|DEGREES=$a1;;;; WARNING=$warning;;;; CRITICAL=$critical;;;;"
		exit 0
		        elif [[ ${a1} -lt "$critical" ]]; then
			echo  "Warning $a1 Celcius|DEGREES=$a1;;;; WARNING=$warning;;;; CRITICAL=$critical;;;;"
			exit 1
				else 
				echo  "Critical $a1 Celcius|DEGREES=$a1;;;; WARNING=$warning;;;; CRITICAL=$critical;;;;"
		                exit 2
				fi 
	elif [[ ${sensornum} ==  "2" ]]; then
	#echo two
	printf -v a1 %.0f ${array[2]}
		if [[ ${a1} -lt "$warning" ]]; then
	        echo "OK $a1 Celcius|DEGREES=$a1;;;; WARNING=$warning;;;; CRITICAL=$critical;;;;"
		exit 0
			elif [[ ${a1} -lt "$critical" ]]; then
                        echo "Warning $a1 Celcius|DEGREES=$a1;;;; WARNING=$warning;;;; CRITICAL=$critical;;;;" 
                        exit 1
			        else 
			        echo  "Critical $a1 Celcius|DEGREES=$a1;;;; WARNING=$warning;;;; CRITICAL=$critical;;;;"
		                exit 2
			        fi 
	elif [[ ${sensornum} ==  "3" ]]; then
        #echo three
        printf -v a1 %.0f ${array[3]}
		if [[ ${a1} -lt "$warning" ]]; then
	        echo "OK $a1 Celcius|DEGREES=$a1;;;; WARNING=$warning;;;; CRITICAL=$critical;;;;"
		exit 0
			elif [[ ${a1} -lt "$critical" ]]; then
                        echo "Warning $a1 Celcius|DEGREES=$a1;;;; WARNING=$warning;;;; CRITICAL=$critical;;;;" 
                        exit 1
				else 
			        echo  "Critial $a1 Celcius|DEGREES=$a1;;;; WARNING=$warning;;;; CRITICAL=$critical;;;;"
		                exit 2
			        fi 
	elif [[ ${sensornum} ==  "4" ]]; then
		warning4=${warning}
		critical4=${critical}
        #echo four
        printf -v a1 %.0f ${array[4]}
		if [[ ${a1} -lt "$warning4" ]]; then
	        echo "OK $a1 Celcius|DEGREES=$a1;;;; WARNING=$warning;;;; CRITICAL=$critical;;;;"
		exit 0
			elif [[ ${a1} -lt "$critical4" ]]; then
                        echo "Warning $a1 Celcius|DEGREES=$a1;;;; WARNING=$warning;;;; CRITICAL=$critical;;;;"
                        exit 1
			        else 
			        echo  "Critical $a1 Celcius|DEGREES=$a1;;;; WARNING=$warning;;;; CRITICAL=$critical;;;;"
				exit 2
			        fi 
###
##echo help and  exit unknown
##prints the error messages.
##prints out  the whole array if  need to diagnose.
##${array[*]}

	else
	printErrorHelpAndExit 
        exit 3
	fi
