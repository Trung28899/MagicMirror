#!/bin/bash/python

from firebase import firebase
import time
import json
firebase = firebase.FirebaseApplication("https://smartmirror-12384.firebaseio.com/", None)

time = firebase.get('Mirror_Serial_Numbers/102030/Monitor/timeOff', '')
print(time)

