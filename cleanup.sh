#/bin/bash

#################################################
# Puts all VMs to original state
# Ing. Alexander Poschenreithner, 2017
#################################################


echo "\e[91mAre you sure you want to clean up all VMs? (y/n)\e[0m"
read -p "" -n 1 -r
echo    # (optional) move to a new line
if [[ $REPLY =~ ^[Yy]$ ]]
then
	# Cleanup server
	echo -e "  => \e[32mRemoving uploaded/transfered files from server VM\e[0m"
	(cd infrastructure/server/share/upload/ && rm badPHP.php badcode.tgz index.php)
	(cd infrastructure/server/share/upload/ && cp index.php.bak index.php )

	# Cleanup mainserver (will be attacked)
	echo -e "  => \e[32mDestroying target server VM\e[0m"
	(cd infrastructure/server && vagrant destroy --force)

	# Start attacker 
	echo -e "  => \e[32mDestroying attacker VM\e[0m"
	(cd infrastructure/attacker && vagrant destroy --force)
fi




echo -e "\e[32mAll VMs are destroyed! Run \"run.sh\" to build them again \e[0m"
