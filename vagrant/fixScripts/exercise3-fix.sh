#!/bin/bash
#add fix to exercise3 here

#replace first appearance of deny from all (for var/www)in default site config file
sudo sed -i '0,/deny from all/s//Allow from all/' /etc/apache2/sites-available/default

#reboot apache
sudo /etc/init.d/apache2 restart
