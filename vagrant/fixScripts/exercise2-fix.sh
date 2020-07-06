#!/bin/bash
#add fix to exercise2 here
#delete ascii-art.de row that is causing the problem in hosts file 
sudo sed -i '/ascii-art.de/d' /etc/hosts
