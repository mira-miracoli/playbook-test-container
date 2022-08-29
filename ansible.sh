#!/bin/bash

#run systemd init
/usr/sbin/init

#run playbook
cd /ansible
ansible-playbook container.yml