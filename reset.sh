#/bin/bash

#################################################
# Reset all VMs, will destroy all of them
# Ing. Alexander Poschenreithner, 2017
#################################################


echo "\e[91mAre you sure you want to destroy all VM-boyes? (y/n)\e[0m"
read -p "" -n 1 -r
echo    # (optional) move to a new line
if [[ $REPLY =~ ^[Yy]$ ]]
then
	# Start logserver
	echo -e "  => \e[32mDestroying logserver VM\e[0m"
	(cd infrastructure/logserver && vagrant destroy --force)

	# Start mainserver (will be attacked)
	echo -e "  => \e[32mDestroying target server VM\e[0m"
	(cd infrastructure/server && vagrant destroy --force)

	# Start attacker 
	echo -e "  => \e[32mDestroying attacker VM\e[0m"
	(cd infrastructure/attacker && vagrant destroy --force)
fi




echo -e "\e[32mAll VMs are destroyed! Run \"run.sh\" to build them again \e[0m"
