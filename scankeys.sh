#!/bin/bash
# script for copying ssh key to the hosts in list_hosts.txt file
for ip in `cat list-hosts.txt`; do
    ssh-copy-id -i ~/.ssh/id_rsa.pub $ip
done