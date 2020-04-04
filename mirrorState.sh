#!/bin/bash

while true;
  do
	output=`python  /home/pi/Firebase/SmartMirror/retrieveMirrorState.py`
	
	if [ $output = 'true' ]
	then
            `/usr/bin/vcgencmd display_power 1`		 
	    echo 'Turn on mirror'
	else
            `/usr/bin/vcgencmd display_power 0`		 
	    echo 'Turn off mirror'
	fi



  done




