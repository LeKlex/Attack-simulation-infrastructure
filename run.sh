#/bin/bash

#################################################
# Starts all virtual machines in correct order
# Ing. Alexander Poschenreithner, 2017
#################################################

echo "Setting up all VMs..."

# Start logserver
echo -e "  => \e[32mStarting logserver VM\e[0m"
(cd infrastructure/logserver && vagrant up)

# Start mainserver (will be attacked)
echo -e "  => \e[32mStarting target server VM\e[0m"
(cd infrastructure/server && vagrant up)

# Start attacker 
echo -e "  => \e[32mStarting attacker VM\e[0m"
(cd infrastructure/attacker && vagrant up)


echo -e "\e[32mAll VMs are up and ready!\e[0m"


echo "\e[91mStart attacks on target server? (y/n)\e[0m"
read -p "" -n 1 -r
echo    # (optional) move to a new line
if [[ $REPLY =~ ^[Yy]$ ]]
then
	echo "Connecting to attacker VM and starting attackScripts.sh ..."
    (cd infrastructure/attacker && vagrant ssh -c "/vagrant_data/attackServer.sh")

    echo "Waiting for attack.log and pcap file to be written..."
    sleep 5
    echo "Moving files to project root..."
    mv infrastructure/attacker/share/attack.log attack.log
    mv infrastructure/server/share/lanDump.pcap lanDump.pcap
    echo "Done."

    # TODO: Clean up project to pre-execute state
fi
