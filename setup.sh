#!/bin/bash
# linux server setup

echo "Using ip address $1"
cat setup_commands.sh | ssh root@$1

echo "replacing sshd_config"
ssh root@$1 "rm /etc/ssh/sshd_config;"
scp ./sshd_config root@$1:/etc/ssh
ssh root@$1 "sudo systemctl reload ssh; sudo systemctl reload sshd;"

# SSH key admin user
ssh-copy-id admin@$1

# SSH key git user
ssh-copy-id -i ~/github_ssh/id_rsa.pub git@$1