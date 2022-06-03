#!/bin/bash
begin=$(date +"%s")
ansible-playbook ./playbooks/provision.yml --ask-vault-pass  -vvv -K --step
termin=$(date +"%s")
difftimelps=$(($termin-$begin))
echo "$(($difftimelps / 60)) minutes and $(($difftimelps % 60)) seconds elapsed for Script Execution."