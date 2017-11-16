#/bin/bash

##############################################################
# Setup for Syslog-Server;
# Ing. Alexander Poschenreithner, 2017
##############################################################
sudo apt-get update

# Uncomment out lines for Syslog over TCP
sudo sed -i '/^#.*ModLoad imtcp/s/^#//' /etc/rsyslog.conf
sudo sed -i '/^#.*InputTCPServerRun 514/s/^#//' /etc/rsyslog.conf

#Change port to one above 1024 - below only with root privileges
sudo sed -i 's/514/9876/g' /etc/rsyslog.conf

# Add Logging-Template
sudo echo '$template TmplAuth, "/var/log/%HOSTNAME%/%PROGRAMNAME%.log"' >> /etc/rsyslog.conf
#sudo bash -c 'echo $template TmplAuth, "/var/log/%HOSTNAME%/%PROGRAMNAME%.log" >> /etc/rsyslog.conf'

# Apply TmplAuth to all types
sudo bash -c 'echo "*.* ?TmplAuth" >> /etc/rsyslog.conf'

# Change permission of log-dir
cd /var && sudo chown syslog:syslog log

# Restart service
sudo service rsyslog restart


##############################################################
# Installing netcat to send file
##############################################################

sudo apt-get install netcat -y

##############################################################
# Installing screen for dump
##############################################################

sudo apt-get install screen -y
