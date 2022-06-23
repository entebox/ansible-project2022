The VMS
1 x ansible ( you can choose the OS ) 
1 x CentOS7 ( do not install gui\desktop )
1 x Ubuntu 20 ( do not install gui\desktop )

The Tasks
On the Ansible instance please install ansible and write a playbook to configure the CentOS 
and Ubuntu.
The playbook should contain 2 roles ( one for centos and one for ubuntu )
ubuntu: 
• Change the hostname to “ubuntu_{your_name}”
• Create a local user ( user name: ansible password: ansible )
• Install the following packages:
 1. git
 2. Chrony-3.4 ( make sure the service is up and running and syncing time with any NTP 
server ) 
 3. Remove ntpdate package 
 4. Add history date to bashrc file ( so when running the history command you will get 
 date and time of each command )
Centos:
• Create a directory with the name { your_full_name } under /tmp ( make sure the owner 
have r+w, group: read-only, world: read-only ) 
• Install iotop, sysstat packages
• Print the distribution version 
• Update OS patches ( yum update ) 
Please create shell script to execute the above ansible playbook – the shell script will call and 
run the ansible playbook, it will also time the running time of the ansible playbook ( how 
long it takes to run the ansible-playbook )

Documentation:
The installation of the VMs
After creation on VirtualBox
1.	Change vm nic to Bridged to make the host talk with the vms
 
2.	Create new network for the vms to talk between them:
 
3.	Add the new network to each vm:
 
4.	Add the new card to netplan on both ubuntu vms:
sudo vi /etc/netplan/00-installer-config.yaml
 
And run sudo netplan apply to take effect immediately
5.	Add the VMs to Tabby
6.	Snapshot the VMs



Ansible server:
Install ansible steps:
1.	sudo apt update && upgrade
2.	sudo apt install ansible
3.	copy public ssh key to your hosts:
ssh-keygen
ssh-copy-id ubuntu@10.0.2.6
ssh-copy-id centos7@10.0.2.7
sudo systemctl stop firewalld
sudo systemctl disable firewalld

or use the script scankeys.sh after modify list_hosts.txt
create ansible folder structure:
1.	create folder ansible-project2022 or clone from my github into /home/ansible
 
2.	git init in the current folder (if not cloned from github.com)
3.	cp /etc/ansible/hosts .
4.	rename hosts to inventory, convert it to yaml (to let ansible-vault work correctly).
ansible-inventory -i inventory.ini -y --list > inventory.yaml
5.	change settings for timeout on /etc/ansible/ansible.cfg:
SSH timeout
timeout = 10 change to 60
6.	create roles folders and inside it run: 
ansible-galaxy init ubuntu
ansible-galaxy init centos
7.	delete all unnecessary files
8.	create playbook and roles (check github ansible-project2022)
9.	ansible vault
1.	create the group_vars file and all vars related roles
2.	create ansible vault and vault-id for security with vault password stored in a file:
3.	from root folder of the project:
create file: vaultpassfile and add vault password to this file.
4.	Encrypt the vars files:
ansible-vault encrypt --vault-id project1@vaultpassfile group_vars/centos_servers.yml group_vars/ubuntu_servers.yml roles/ubuntu/vars/main.yml roles/centos/vars/main.yml
5.	To edit encrypted files:
ansible-vault edit --vault-id project1@vaultpassfile foo.yml

10.	run test playbook
ansible all -m ping --vault-password-file vaultpassfile
to test connection
11.	run the playbook from root folder:
ansible-playbook ./playbooks/provision.yml --vault-password-file vaultpassfile -vvv –step
TESTS

Ubuntu:
1.hostname
2. connect via ssh ansible@10.0.2.6 with password ansible
3. check git version
4. sudo systemctl status chrony
5. check if ntpdate present 
dpkg -l | grep ntpdate
6. history

Centos:
1. ls -ld /tmp/avi_berger
2. yum info iotop | grep Repo | awk '{ print $3 }'
    Or run: iotop
3. yum info sysstat | grep Repo | awk '{ print $3 }'
    Or run for cpu check: sar -P ALL 1 1
    For memory check: sar -r 1 3
4. check playbook output
5. yum update = 0
6. check script output for time measurment



