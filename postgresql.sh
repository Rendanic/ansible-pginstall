sudo ansible-galaxy -p /etc/ansible/roles install geerlingguy.postgresql
ansible-playbook -i inventory/hosts postgres-community.yml