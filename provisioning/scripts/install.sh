#!/bin/bash
yum -y install epel-release
yum -y install figlet

cat >>/etc/hosts<<EOF
$1  $2  $3
EOF


figlet utilities
yum install -y -q yum-utils curl  git nano wget > /dev/null 2>&1


figlet SSH
sed -i 's/^PasswordAuthentication no/PasswordAuthentication yes/' /etc/ssh/sshd_config
systemctl reload sshd
echo $4 | passwd --stdin root >/dev/null 2>&1
echo "export TERM=xterm" >> /etc/bashrc