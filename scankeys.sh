#!/bin/bash
for ip in `cat list-hosts.txt`; do
    ssh-copy-id -i ~/.ssh/id_rsa.pub $ip
done