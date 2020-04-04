#!/bin/bash/python

from firebase import firebase
import time
import json
firebase = firebase.FirebaseApplication("https://smartmirror-12384.firebaseio.com/", None)
accounts = firebase.get('/Accounts/', '');
serial = firebase.get('/Mirror_Serial_Numbers/', '')
settings = firebase.get('settings', '')

sensor = firebase.get('/LED_Sensor/', '')
MirrorState = firebase.get('Mirror_Serial_Numbers/102030/Monitor/monitorState/', '')
print(MirrorState)

