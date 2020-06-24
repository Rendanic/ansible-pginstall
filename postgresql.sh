#!/bin/bash

if [ "$#" = 0 ] ; then
    echo "start with path to inventory file"
    echo "example: postgresql.sh -i inventory/vagrant/hosts"
    exit 1
fi

echo "ansible-galaxy geerlingguy.postgresql"
ansible-galaxy install geerlingguy.postgresql || exit 1

echo "ansible-playbook"
ansible-playbook postgres-community.yml $*