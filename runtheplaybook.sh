#!/bin/bash
start_script=$(date +"%s")
ansible-playbook ./playbooks/provision.yml --ask-vault-pass -vvv
end_script=$(date +"%s")
runtime=$(($end_script-$start_script))
echo "$(($runtime / 60)) minutes and $(($runtime % 60)) seconds elapsed for Script Execution."