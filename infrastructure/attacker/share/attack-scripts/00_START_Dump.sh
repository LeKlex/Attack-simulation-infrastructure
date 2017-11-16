#/bin/bash

##############################################################
# Start logging on main server (attacker connects to server and starts tshark)
# Ing. Alexander Poschenreithner, 2017
##############################################################

# Tried to log all traffic on Logserver but a lot of services were ignored / not recognized -.-

echo "     => Starting TShark on Server (10.11.12.10)"


# Connect and start screen with landumping
sshpass -p "dumper" ssh -o StrictHostKeyChecking=no dumper@10.11.12.10 "screen -dmS landump bash -c 'sudo tshark -i eth1 -T fields -e frame.time -e ip.src -e ip.dst -e ip.dst_host -e dns.qry.name -e dns.resp.addr -w /tmp/dump.pcap'"
