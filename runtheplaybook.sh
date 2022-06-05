#!/bin/bash
start_script=$(date +"%s") # get the start time and date
ansible-playbook ./playbooks/provision.yml --vault-password-file vaultpassfile -vvv # run the playbook with debug option (-vvv)
end_script=$(date +"%s") # get the end time and date
runtime=$(($end_script-$start_script)) # get the delta between both of the times taken
echo -e "\033[1;34m(($runtime / 60)) minutes and $(($runtime % 60)) seconds elapsed for Script Execution." # prints the minutes and seconds of the result