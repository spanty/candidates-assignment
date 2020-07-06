#!/bin/bash
#add fix to exercise4-server2 here
#delete server1 row in case it exists
sudo sed -i '/server1/d' /etc/hosts

# add new entry to hosts file. redirect output to /dev/null to silence echo
echo '192.168.100.10 server1' | sudo tee -a /etc/hosts >/dev/null
