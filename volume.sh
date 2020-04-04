#!/bin/bash

while true;
  do
	output=`python  /home/pi/Firebase/SmartMirror/retrieveSmartMirror.py`
	amixer cset numid=1  $output%
	echo $output
  done




