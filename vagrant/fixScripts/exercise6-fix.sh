#!/bin/bash
#add fix to exercise6-fix here

if [ $# -lt 2 ]; then
	echo 'ERROR: Incorrect number of variables - less than 2'
	exit 1
fi

if [ "$HOSTNAME" = "server1" ]; then
	remote_server="server2"
elif [ "$HOSTNAME" = "server2" ]; then
	remote_server="server1"
else
	echo 'ERROR: Running on unknown server'
	exit 2
fi

executor=$(id -u -n)

#install sshpass
sudo apt-get install sshpass >> /dev/null

# remote path is the last argument
remote_path="${!#}"

#local pathes - all argumets except last one
local_pathes=${@:1:$#-1}

total_bytes=0
for path in ${local_pathes[@]}
do
	#assumption user vagrant is in list of sudoers at remote server	and root has password as user vagrant	
	sshpass -p 'vagrant' scp -o StrictHostKeyChecking=no $path $executor@$remote_server:$remote_path
    total_bytes=$(($(stat -c "%s" $path) + $total_bytes))
done

echo $total_bytes

