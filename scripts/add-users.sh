#!/bin/bash

for user in Manohar ramu latha raja; do htpasswd -b /etc/origin/master/htpasswd $user r3dh4t1!;
done
