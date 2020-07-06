#!/bin/bash
#add fix to exercise4-server1 here
#delete server2 row in case it exists
sudo sed -i '/server2/d' /etc/hosts

# redirect to /dev/null to silence echo
echo '192.168.100.11 server2' | sudo tee -a /etc/hosts >/dev/null
