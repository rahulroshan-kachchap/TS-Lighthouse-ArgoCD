cd /work
git clone https://github.com/rahulroshan-kachchap/TS-Lighthouse-ArgoCD.git
cd TS-Lighthouse-ArgoCD
cp gpu/ansible_files/test.sh /work/
cd /work
ansible-playbook playbook.yaml -i host.ini > ansible.log

sleep 1000000s
