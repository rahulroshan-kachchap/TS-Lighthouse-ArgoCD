#!/bin/bash
user='rahul'
pass='Password!234'
ip='192.168.0.123'
ssh-keygen -t rsa << HERE




HERE
echo "ssh-keygen generated successfully"
sleep 10s
sshpass -p $pass ssh-copy-id -o StrictHostKeyChecking=no $user@$ip
if [ $? -eq 0 ];
then
	echo "copy worked"
else
	echo "copy failed"
fi
echo "copy public key done"
sleep 5s

cd /work
git clone https://github.com/rahulroshan-kachchap/TS-Lighthouse-ArgoCD.git
sleep 5s
cd TS-Lighthouse-ArgoCD
cp gpu/ansible_files/upgrade.sh /work/

cd /work
ansible-playbook --ssh-common-args="-o StrictHostKeyChecking=no" playbook.yaml -i host.ini >> ansible.log

runforever()
{
	wait
}

########## MAIN ########

runforever
