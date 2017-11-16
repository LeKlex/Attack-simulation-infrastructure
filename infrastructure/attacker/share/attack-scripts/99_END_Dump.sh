#/bin/bash

##############################################################
# Stop network traffic sniffing on main server - end of attack
# Ing. Alexander Poschenreithner, 2017
##############################################################

echo "     => Ending TShark on Server (10.11.12.10) and moving dump to share"

# Stop tshakr & move dump to share (cant be written directly there!)
sshpass -p "dumper" ssh -o StrictHostKeyChecking=no dumper@10.11.12.10 "sudo pkill tshark; sudo mv /tmp/dump.pcap /vagrant_data/lanDump.pcap"
