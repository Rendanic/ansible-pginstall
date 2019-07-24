#!/bin/bash

if [ "$#" -ne 1 ] ; then
    echo "start with path to inventory file"
    echo "example: postgresql.sh inventory/vagrant/hosts"
    exit 1
fi

sudo ansible-galaxy -p /etc/ansible/roles install geerlingguy.postgresql
ansible pgserver -i ${1} -m ping
if [ "$?" -ne 0 ] ; then
    exit 1
fi
ansible-playbook -i ${1} postgres-community.yml
