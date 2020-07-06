#!/bin/bash
#add fix to exercise5-server1 here

filename="id_rsa"
path="$HOME/.ssh"
user="vagrant"
password="vagrant"
server="server2"

# needed to pass password to ssh
sudo apt-get install sshpass

#Generate RSA key
ssh-keygen -t rsa -b 4096 -N '' -f $path/$filename -q

# Copying public key to server2. ssh-copy-id doesn't allow to supress new host checking
cat $path/$filename.pub | sshpass -p $password ssh -q -oStrictHostKeyChecking=no $user@$server \
	"mkdir -p ~/.ssh && chmod 700 ~/.ssh && cat >> ~/.ssh/authorized_keys && chmod 600 ~/.ssh/authorized_keys"
