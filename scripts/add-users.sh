#!/bin/bash
touch /etc/origin/master/htpasswd
for user in manohar ramu latha raja; do htpasswd -b /etc/origin/master/htpasswd $user r3dh4t1!;
done
