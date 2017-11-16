#/bin/bash

##############################################################
# Setup for attacker;
# Ing. Alexander Poschenreithner, 2017
##############################################################

sudo apt-get update

##############################################################
# Install needed packages
##############################################################

# CURL
sudo apt-get install curl -y

# NMAP
sudo apt-get install nmap -y

# Hydra
sudo apt-get install hydra -y 

# Netcat
sudo apt-get install netcat -y

# Select traditional version (not BSD)
sudo su -c 'echo "2" | sudo update-alternatives --config nc'

# Build dummy dictionary of british words 
sudo apt-get install wbritish -y
sudo sort -R /usr/share/dict/british-english | head -n 316 > /tmp/passwordlist_1.txt
# Add used passwords to Dict
sudo echo 'lucky75' >> /tmp/passwordlist_1.txt

sudo sort -R /usr/share/dict/british-english | head -n 152 > /tmp/passwordlist_2.txt
sudo echo 'qerty' >> /tmp/passwordlist_2.txt


# SSHPass for auto connect
sudo apt-get install sshpass -y
