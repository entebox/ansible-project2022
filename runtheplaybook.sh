#!/bin/bash
start_script=$(date +%s.%N) # get the start time and date
ansible-playbook ./playbooks/provision.yml -i inventory.yaml --vault-password-file vaultpassfile # run the playbook with debug option (-vvv)
end_script=$(date +"%s") # get the end time and date
runtime=$(echo "$(date +%s.%N) - $start_script" | bc) # get the delta between both of the times taken
running_time=`printf "%.2f seconds" $runtime`
echo -e "\033[1;34mRunning Time: $running_time" # prints the minutes and seconds of the result