#!/usr/bin/sh

export GUID=`hostname | cut -d"." -f2`

ansible masters -m shell -a 'htpasswd -b /etc/origin/master/htpasswd ankit r3dh4t1!'
ansible masters -m shell -a 'htpasswd -b /etc/origin/master/htpasswd andrew r3dh4t1!'
ansible masters -m shell -a 'htpasswd -b /etc/origin/master/htpasswd briany r3dh4t1!'
ansible masters -m shell -a 'htpasswd -b /etc/origin/master/htpasswd brett r3dh4t1!'

oc adm groups new alpha ankit andrew
oc adm groups new beta briany brett

for OCP_USERNAME in ankit andrew briany brett; do

oc create clusterquota clusterquota-$OCP_USERNAME \
 --project-annotation-selector=openshift.io/requester=$OCP_USERNAME \
 --hard pods=25 \
 --hard requests.memory=6Gi \
 --hard requests.cpu=5 \
 --hard limits.cpu=25  \
 --hard limits.memory=40Gi \
 --hard configmaps=25 \
 --hard persistentvolumeclaims=25  \
 --hard services=25

done

pwd=`pwd`
export pwd=$pwd/proj-temp.yml
echo "Create template from ${pwd}"
oc create -f $pwd

ansible masters -m shell -a "sed -i 's/projectRequestTemplate.*/projectRequestTemplate\: \"default\/project-request\"/g' /etc/origin/master/master-config.yaml"
ansible masters -m shell -a'systemctl restart atomic-openshift-node'
