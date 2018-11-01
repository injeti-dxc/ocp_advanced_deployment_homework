#!/bin/bash

for user in ankit andrew briany brett; do 
htpasswd -b /etc/origin/master/htpasswd $user r3dh4t1!;
done
