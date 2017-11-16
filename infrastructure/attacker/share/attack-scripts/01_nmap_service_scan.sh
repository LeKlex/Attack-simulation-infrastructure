#!/bin/sh

##############################################################
# NMAP Service scan
# Ing. Alexander Poschenreithner, 2017
##############################################################

# Ports to scan are limited to 10.11.12.0-110, attacker is 111 ;-)

# Scan Hosts in network
echo "     => NAMP Scan for hosts in Network"
nmap -sP 10.11.12.-110 >> /tmp/attack.log

#Scann full network
echo "     => NAMP Scan for Services on all hosts"
nmap -sT 10.11.12.-110 >> /tmp/attack.log

# Quick scan
echo "     => NAMP quick scan on target server"
nmap -sT 10.11.12.10 >> /tmp/attack.log

## Service scan
echo "     => NAMP detailed service scan on target server"
nmap -sV -T4 -F 10.11.12.10 >> /tmp/attack.log