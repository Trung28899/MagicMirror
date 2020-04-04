#!/bin/bash

while true;
  do
	OffTime=`python  /home/pi/Firebase/SmartMirror/retrieveMonitorTimeoff.py`	
	OnTime=`python  /home/pi/Firebase/SmartMirror/retrieveMonitorTimeON.py`
	stateTime=`python  /home/pi/Firebase/SmartMirror/retrieveMonitorState.py`
	echo $OffTime
	echo $OnTime
	echo $stateTime
	now=`date +%r`
	IFS=':'
	read -ra ADDR <<< "$OffTime"
	for i in "${ADDR[0]}"; do # access each element of array
	  	p1=$(($i *3600))
	 done
	for i in "${ADDR[1]}"; do # access each element of array
		p2=$(($i *60))
	 done
         offTimeInSeconds=$(($p1+$p2))
         echo 'Offtime  in seconds: ' +$offTimeInSeconds 

	read -ra ADDR <<< "$OnTime"
	for i in "${ADDR[0]}"; do # access each element of array
	  	p1=$(($i *3600))
	 done
	for i in "${ADDR[1]}"; do # access each element of array
		p2=$(($i *60))
	 done
         OnTimeInSeconds=$(($p1+$p2))
         echo 'ontime  in seconds: ' +$OnTimeInSeconds 


	 Time=$(date +%r)
	 echo 'Time 24 formate' + $Time
	 read -ra ADDR <<< "$Time"
	 for i in "${ADDR[0]}"; do # access each element of array
	  	Hsecs=$(($i *3600))
	  done
	 for i in "${ADDR[1]}"; do # access each element of array
		Msecs=$(($i *60))
	  done

          currentTimeInSeconds=$(($Hsecs + $Msecs))	
	  echo 'current time in seconds' + $currentTimeInSeconds


	  Offdifference=$(($currentTimeInSeconds - $offTimeInSeconds))   
          echo 'Difference off:' + $Offdifference   
          Ondifference=$(($currentTimeInSeconds - $OnTimeInSeconds)) 
          echo 'Difference on: ' + $Ondifference
          
	  if  [ $offTimeInSeconds -le $currentTimeInSeconds ] && [  $currentTimeInSeconds -le  $OnTimeInSeconds ] 
	     then
                 ` /usr/bin/vcgencmd display_power 0 `		
		  echo 'Turn off the mirror and inside the range'
	  else
                 ` /usr/bin/vcgencmd display_power 1 `		
		  echo 'Outside the range'
	    fi

	  #$if  ([ $stateTime = 'true' ]  &&  [ $Offdifference -eq 0 ])
	   #$then  
	   #$   echo 'Turning off the mirror'
  #$    elif ([ $stateTime = 'true' ]  &&  [ $((10#$Ondifference)) -eq 0 ])
          #$ then
	#$      echo 'Turning back  the mirror'
	  #$fi
	 


 done
