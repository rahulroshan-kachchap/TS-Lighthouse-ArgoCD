ssh-keygen -t rsa << HERE




HERE
sshpass -p 'Password!234' ssh-copy-id rahul@192.168.0.123
cd /work
git clone https://github.com/rahulroshan-kachchap/TS-Lighthouse-ArgoCD.git
cd TS-Lighthouse-ArgoCD
cp gpu/ansible_files/upgrade.sh /work/
cd /work
ansible-playbook --ssh-common-args="-o StrictHostKeyChecking=no" playbook.yaml -i host.ini >> ansible.log

sleep 1000000s
