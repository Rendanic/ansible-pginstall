#!/bin/bash

if [ "$#" -ne 1 ] ; then
    echo "start with path to inventory file"
    echo "example: postgresql.sh inventory/vagrant/hosts"
    exit 1
fi

inventory="$1"

echo "ansible-galaxy geerlingguy.postgresql"
ansible-galaxy install geerlingguy.postgresql || exit 1

echo "ansible ping hosts from inventory"
ansible pgserver -i "${inventory}" -m ping || exit 1

echo "ansible-playbook"
shift
ansible-playbook -i "${inventory}" postgres-community.yml "$*"
