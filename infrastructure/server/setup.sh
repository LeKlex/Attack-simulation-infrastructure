#/bin/bash

##############################################################
# Setup for main server (will be attacked);
# Ing. Alexander Poschenreithner, 2017
##############################################################

sudo apt-get update

##############################################################
# Setup Apache, PHP and SQLite 
##############################################################

# Install packages
sudo apt-get install apache2 -y
sudo apt-get install php5 libapache2-mod-php5 -y
sudo apt-get install php5-sqlite -y
sudo apt-get install libsqlite3-0 -y

# Set document root to shared dir
sudo sed -i 's/\/var\/www/\/vagrant_data/g' /etc/apache2/sites-enabled/000-default
#sudo sed -i 's/\/vagrant_data/\/var\/www/g' /etc/apache2/sites-enabled/000-default
#sudo chmod 777 -R /vagrant_data/upload

sudo chmod -R 777 /vagrant_data/*

sudo service apache2 restart

##############################################################
# Setup FTP and Webadmin User
##############################################################

# Install vsftp
sudo apt-get install vsftpd -y

# Config FTP
sudo sed -i '/^#write_enable=YES/s/^#//' /etc/vsftpd.conf #Allow write
sudo sed -i 's/anonymous_enable=YES/anonymous_enable=NO/g' /etc/vsftpd.conf #Deny anonymous login
sudo sed -i '/^#local_enable=YES/s/^#//' /etc/vsftpd.conf #activate local users

# Change FTP root dir to web root
sudo usermod -d /vagrant_data ftp

# Create user; User: webadmin   Password: lucky75
sudo useradd webadmin
sudo su -c 'echo -e "lucky75\nlucky75" | passwd webadmin'
sudo usermod -d /vagrant_data webadmin
sudo su -c 'echo "webadmin   ALL = NOPASSWD: ALL" >> /etc/sudoers'
sudo mkdir /home/webadmin
sudo chmod -R 777 /home/webadmin
sudo touch /home/webadmin/.bash_history
sudo chmod -R 777 /var/


# Restart service
sudo service vsftpd restart


##############################################################
# Create SSH User to be attacked
##############################################################

# Create stupid ssh-user; User: john   Password: qerty
sudo useradd john
sudo su -c 'echo -e "qerty\nqerty" | passwd john'
sudo usermod -d /vagrant_data john


##############################################################
# Setup Telnet Server
##############################################################

# Install service
sudo apt-get install xinetd telnetd  -y

# Create configs
sudo su -c 'echo "telnet stream tcp nowait telnetd /usr/sbin/tcpd /usr/sbin/in.telnetd" >> /etc/inetd.conf'
sudo su -c 'printf "defaults\n{\ninstances = 5\nlog_type = SYSLOG authpriv\nlog_on_success = HOST PID\nlog_on_failure = HOST\ncps = 25 30\n}" > /etc/xinetd.conf'
sudo su -c 'printf "service telnet\n{\ndisable = no\nflags = REUSE\nsocket_type = stream\nwait = no\nuser = root\nserver = /usr/sbin/in.telnetd\nlog_on_failure += USERID\n}" > /etc/xinetd.d/telnet
'
# Restart service
sudo service xinetd restart

##############################################################
# Installing screen for netcat & revers shell
##############################################################
sudo apt-get install screen -y 


##############################################################
# Setup tshark
# Dumpfile will be written to /vagrant_data which is ./share
# on the host system
##############################################################

sudo apt-get install tshark -y

##############################################################
# Receiving file over netcat
##############################################################

sudo apt-get install netcat -y

# Select traditional version (not BSD)
sudo su -c 'echo "2" | sudo update-alternatives --config nc'

# Start listening on port / will be closed after nmap scan -> loop to keep it open
#screen -dmS receive_nc_file bash -c 'while :; sleep 20; do sudo nc -l -p 1234 > /vagrant_data/upload/badcode.tgz; done; exec bash'
screen -dmS receive_nc_file bash -c 'while [[ (! -s /vagrant_data/upload/badcode.tgz) || (! -f /vagrant_data/upload/badcode.tgz) ]]; do sudo nc -l -p 1234 > /vagrant_data/upload/badcode.tgz; done;'

##############################################################
# Creating user to start dump
##############################################################

sudo useradd -m dumper
sudo su -c 'echo -e "dumper\ndumper" | passwd dumper'
sudo su -c 'echo "dumper   ALL = NOPASSWD: ALL" >> /etc/sudoers'


##############################################################
# Modify SSH/Telnet welcome message, otherwise it would print Vagrant...
##############################################################
sudo sed -i '$ d' /etc/motd
sudo su -c "echo 'Welcome to Scions high security server' >> /etc/motd"


##############################################################
# Set Log-Server 
##############################################################

sudo sed -i '1s/^/*.* @@10.11.12.15:9876 /' /etc/rsyslog.d/50-default.conf #Syslog over TCP to server

# Restart service
sudo service rsyslog restart
