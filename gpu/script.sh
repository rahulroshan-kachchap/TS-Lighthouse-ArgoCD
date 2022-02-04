ssh-keygen -t rsa << HERE




HERE
echo "ssh-keygen generated successfully"
sleep 10s
ssh-copy-id -i ~/.ssh/id_rsa.pub rahul@192.168.0.123 -p 'Password!234'
if [ $? -eq 0 ];
then
	echo "copy worked"
else
	echo "copy failed"
	exit -1
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

sleep 1000000s
