#!/bin/sh

echo "Control Node Preparation ..."

yum update -y
yum install -y python39 epel-release wget
yum makecache

sed -i 's/PasswordAuthentication no/PasswordAuthentication yes/g' /etc/ssh/sshd_config
systemctl restart sshd

export PATH="/usr/local/bin:$PATH"
source  ~/.bash_profile

PASS=$(echo "control" | openssl passwd -1 -stdin)
useradd -p "$PASS" ansible
cat <<EOF > /etc/sudoers.d/ansible
ansible  ALL=(ALL)  NOPASSWD: ALL
EOF

cat <<EOF > /etc/hosts
192.168.30.200 control.clevory.local
192.168.30.201 node1.clevory.local
192.168.30.202 node2.clevory.local
EOF
