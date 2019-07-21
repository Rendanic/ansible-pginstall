sudo ansible-galaxy -p /etc/ansible/roles install geerlingguy.postgresql
ansible-playbook -i ${1} postgres-community.yml
