#!/bin/bash -x
ssh-keygen -t rsa << HERE




HERE
echo "ssh-keygen generated successfully"
sleep 10s

cd /work
git clone https://github.com/rahulroshan-kachchap/TS-Lighthouse-ArgoCD.git
sleep 5s
cd TS-Lighthouse-ArgoCD
cp gpu/upgrade.sh /work/

cd /work
ansible-playbook --ssh-common-args="-o StrictHostKeyChecking=no" playbook.yaml -i host.ini --private-key /tmp/secret-ssh-auth/ssh-privatekey.pem >> ansible.log
cat ansible.log

sleep 10000000s
