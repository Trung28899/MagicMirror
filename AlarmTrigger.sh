#!/bin/bash

while true;
  do
	TimerState=`python  /home/pi/Firebase/SmartMirror/retrieveAlarmState.py`	
	Time=`python  /home/pi/Firebase/SmartMirror/retrieveAlarmTime.py`
	now=`date +%r`
	IFS=':'
	read -ra ADDR <<< "$Time"
	for i in "${ADDR[0]}"; do # access each element of array
		p1=$(($i *3600))
	done
	for i in "${ADDR[1]}"; do # access each element of array
		p2=$(($i *60))
	done
        timetotal=$(($p1+$p2))
        echo 'databse time in seconds: ' +$timetotal  
	varir=`echo "$now" | grep -o "[0-9.]\+"`
        echo 'Current time:' + ${var// /:} 
        echo 'Database time:' + $Time
	var=$(date +%H)
	var1=$(date +%M)
	var2=$(date +%s)
	Hsecs=$(($var * 3600)) 
        Msecs=$(($var1 * 60))

        total=$(($Hsecs+$Msecs))	
	echo 'current time in seconds' + $total
	difference=$(($timetotal - $total))   
        echo $difference    
	ten=$((10#0))
	if  ([ $TimerState = 'true' ]  &&  [ $difference -eq 0 ])
	then
	    `aplay /home/pi/alarmsound.wav` 
	    echo 'The alarm is on'
	else
	    echo 'The alarm is off'
	fi



  done



